#!/bin/bash

# Database parameters
MYSQL_ROOT_PWD=${MYSQL_ROOT_PWD:-""}
MYSQL_USER=${MYSQL_USER:-"dbadmin"}
MYSQL_USER_PWD=${MYSQL_USER_PWD:-"dbadmin"}
MYSQL_USER_DB=${MYSQL_USER_DB:-"clamp_cancer"}

# API parameters
CLAMP_RUN=${CLAMP_RUN:-1}
CLAMP_JAVA_OPTS=${CLAMP_JAVA_OPTS:-"-Xmx8g"}
METAMAP_RUN=${METAMAP_RUN:-1}
METAMAP_JAVA_OPTS=${METAMAP_JAVA_OPTS:-"-Xmx8g"}
CTAKES_RUN=${CTAKES_RUN:-1}
CTAKES_JAVA_OPTS=${CTAKES_JAVA_OPTS:-"-Xmx8g"}

# Setup MySQL
if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ -d /var/lib/mysql/mysql ]; then
	echo '[i] MySQL directory already present, skipping creation'
else
	echo "[i] MySQL data directory not found, creating initial DBs"

	chown -R mysql:mysql /var/lib/mysql

	echo 'Initializing database'
	mysql_install_db --user=root --datadir=/var/lib/mysql
	echo 'Database initialized'

	echo "[i] MySql root password: $MYSQL_ROOT_PWD"

	tfile=`mktemp`
	if [ ! -f "$tfile" ]; then
	    return 1
	fi

	echo "[i] Create temp file: $tfile"
	cat << EOF > $tfile
USE mysql;
FLUSH PRIVILEGES;
-- DELETE FROM mysql.user;
-- GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD' WITH GRANT OPTION;
-- GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PWD' WITH GRANT OPTION;
EOF


	if [ "$MYSQL_USER_DB" != "" ]; then
		echo "[i] Creating database: $MYSQL_USER_DB"
		echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_USER_DB\` CHARACTER SET utf8 COLLATE utf8_general_ci;" >> $tfile

		if [ "$MYSQL_USER" != "" ] && [ "$MYSQL_USER_PWD" != "" ]; then
            echo "[i] Creating user: $MYSQL_USER with password $MYSQL_USER_PWD"
            echo "GRANT ALL ON \`$MYSQL_USER_DB\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PWD';" >> $tfile
		fi
	else
		if [ "$MYSQL_USER" != "" ] && [ "$MYSQL_USER_PWD" != "" ]; then
            echo "[i] Creating user: $MYSQL_USER with password $MYSQL_USER_PWD"
            echo "GRANT ALL ON *.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PWD';" >> $tfile
		fi
	fi

	echo 'FLUSH PRIVILEGES;' >> $tfile
    
	echo "[i] Running tempfile: $tfile"
	/usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tfile
    rm -f $tfile
    
fi

echo "[i] Sleeping 5 sec"
sleep 5

# Start MySQL
echo '[i] Starting running mysqld'
/usr/bin/mysqld --user=root --console &
sleep 5

# Import application database data
echo '[i] Importing application database data. This may take a while.'
mysql -u root -D clamp_cancer < /data/dump.sql
echo '[i] Finished importing data.'
rm -f /data/dump.sql

if [ "$UMLS_USER" != "" ] && [ "$UMLS_PASS" != "" ]; then
	# Start Main API
	if [ "$CLAMP_RUN" != 0 ]; then
        echo '[i] Starting THEIA Main API for Clamp Indexing and Querying'
        cd /app/api/clamp
        nohup java ${CLAMP_JAVA_OPTS} -jar /app/api/clamp/theia-1.0.jar > /app/api/clamp/nohup.out 2>&1 &
        sleep 10
    else
		echo '[i] Skipping starting THEIA Main API : Not recommended.'
    fi
	# Start MetaMap Lite API
	if [ "$METAMAP_RUN" != 0 ]; then
		echo '[i] Starting THEIA MetaMap Lite API'
		cd /app/api/metamap
		nohup java ${METAMAP_JAVA_OPTS} -jar /app/api/metamap/metamap-indexer-1.0.jar > /app/api/metamap/nohup.out 2>&1 &
		sleep 10
	else
		echo '[i] Skipping starting THEIA MetaMap Lite API.'
	fi
	# Start cTAKES API
	if [ "$CTAKES_RUN" != 0 ]; then
		echo '[i] Starting THEIA cTAKES API'
		cd /app/api/ctakes
		nohup java ${CTAKES_JAVA_OPTS} -D"ctakes.umlsuser"="$UMLS_USER" \
		                               -D"ctakes.umlspw"="$UMLS_PASS" \
		                               -D"ctakes.umlsaddr"="https://uts-ws.nlm.nih.gov/restful/isValidUMLSUser" \
		                               -D"resources/org/apache/ctakes/dictionary/lookup/fast/sno_rx_16ab.xml" \
		                               -jar /app/api/ctakes/ctakes-indexer-1.0.jar > /app/api/ctakes/nohup.out 2>&1 &
		sleep 10
	else
		echo '[i] Skipping starting THEIA cTAKES API.'
	fi
else
	echo '[i] Failed to start NLP APIs: No UMLS credentials provided.'
fi

# Start Apache
echo '[i] Starting THEIA Frontend w/ apache2 on localhost'
exec /usr/sbin/httpd -D FOREGROUND