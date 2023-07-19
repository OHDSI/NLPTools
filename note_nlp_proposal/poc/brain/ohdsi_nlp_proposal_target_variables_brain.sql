DROP TABLE IF EXISTS icdo3_histologies;

CREATE table icdo3_histologies(
    icdo3_description         varchar(255) null
,   icdo3_code                varchar(255) null
,   category                  varchar(255) null
);

INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'diffuse astrocytoma, idh-mutant','9400/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'gemistocytic astrocytoma, idh-mutant','9411/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'diffuse astrocytma, idh-wildtype','9400/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'diffuse astrocytma, nos','9400/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'anaplastic astrocytoma, idh-mutant','9401/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'anaplastic astrocytoma, idh-wildtype','9401/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'anaplastic astrocytoma, nos','9401/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'glioblastoma idh-wildtype','9440/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'giant cell glioblastoma','9411/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'gliosarcoma','9442/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'epithiloid glioblastoma','9440/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'glioblastoma, idh-mutant','9445/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'glioblastoma, nos','9440/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'diffuse midline glioma, h3 k27m-mutant','9385/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'oligodendroglioma, idh-mutant and 1p/19q codeleted','9450/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'oligodendroglioma, nos','9450/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'anaplastic oligodendroglioma, idh mutant and 1p/19q codeleted','9451/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'anaplastic oligodendroglioma,  nos','9451/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'oligastrocytoma, nos','9382/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'anaplastic oligoastrocytoma, nos','9382/3','diffuse astocytic and oligodendroglial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'pilocytic astrocytoma','9421/1','other astrocytic tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'pilomyxoid astrocytoma','9424/3','other astrocytic tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'subependymal giant cell astrocytoma','9424/3','other astrocytic tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'pleomorphic xanthoastrocytoma','9424/3','other astrocytic tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'anaplastic pleomorphic xanthoastrocytoma','9424/3','other astrocytic tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'subependymoma','9383/1','ependymal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'myxopapillary ependymoma','9394/1','ependymal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'ependymoma','9391/3','ependymal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'papillary ependymoma','9393/3','ependymal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'clear cell ependymoma','9391/3','ependymal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'tanycytic ependymoma','9391/3','ependymal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'ependymoma rela fusion-positive','9396/3','ependymal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'anaplastic ependymoma','9392/3','ependymal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'choroid glioma of the third ventricle','9444/1','other gliomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'angiocentric gloma','9431/1','other gliomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'astroblastoma','9430/3','other gliomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'choroid plexus papilloma','9390/0','choroid plexus';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'atypical choroid plexus papilloma','9390/1','choroid plexus';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'choroid plexus carcinoma','9390/3','choroid plexus';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'dysembryoplastic neuroepithelial tumor','9413/0','neuronal and mixed neuronal-glial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'gangliocytoma','9492/0','neuronal and mixed neuronal-glial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'ganglioglioma','9505/1','neuronal and mixed neuronal-glial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'anaplastic ganglioglioma','9505/3','neuronal and mixed neuronal-glial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'dysplastic cerebellar gangliocytoma (lhermitte-duclos disease)','9493/0','neuronal and mixed neuronal-glial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'desmoplastic infantile astrocytom and ganglioglima','9412/1','neuronal and mixed neuronal-glial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'papillary glioneuronal tumor','9509/1','neuronal and mixed neuronal-glial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'rosette-forming glioneuronal tumor','9509/1','neuronal and mixed neuronal-glial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'diffuse leptomeningeal glioneuronal tumor','9506/1','neuronal and mixed neuronal-glial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'central neurocytoma','9506/1','neuronal and mixed neuronal-glial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'extraventricular neurocytoma','9506/1','neuronal and mixed neuronal-glial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'cerebellar liponeurocytoma','9506/1','neuronal and mixed neuronal-glial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'paraganglioma','8693/1','neuronal and mixed neuronal-glial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'pineocytoma','9361/1','tumors of the pineal region';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'pineal parenchymal tumor of intermediate differentiation','9362/3','tumors of the pineal region';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'pineolblastoma','9362/3','tumors of the pineal region';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'papillary tumor of the pineal region','9395/3','tumors of the pineal region';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'medulloblastoma wnt-activated','9475/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'medulloblastoma shh-activated and tp53-mutant','9476/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'medulloblastoma shh-activated and tp53-wildtype','9471/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'medulloblastoma, non-wnt/non-SHH','9477/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'medulloblastoma, group 3','9477/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'medulloblastoma, group 4','9477/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'medulloblastoma, classic','9470/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'medulloblastoma, desmoplastic/nodular','9471/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'medulloblastoma with extensive nodularity','9471/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'medulloblastoma large cell /anaplastic','9474/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'medulloblastoma, nos','9470/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'embryonal tumor with multilayered rosettes, c19mc-altered','9478/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'medulloepithelioma','9501/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'cns neuroblastoma','9500/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'cns ganglioneuroblastoma','9490/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'cns embryonal tumor, nos','9473/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'atypical teratoid/rhabdoid tumor','9508/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'cns embryonal tumor with rhabdoid features','9508/3','embryonal tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'schwannoma','9560/0','tumors of the cranial and paraspinal nerves';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'cellular schwannoma','9560/0','tumors of the cranial and paraspinal nerves';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'plexiform schwannoma','9560/0','tumors of the cranial and paraspinal nerves';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'melanotic schwannoma','9560/1','tumors of the cranial and paraspinal nerves';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'neurofibroma','9540/0','tumors of the cranial and paraspinal nerves';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'atypical neurofibroma','9540/0','tumors of the cranial and paraspinal nerves';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'plexiform neurofibroma','9550/0','tumors of the cranial and paraspinal nerves';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'malignant peripheral nerve sheath tumor','9540/3','tumors of the cranial and paraspinal nerves';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'epitheliod mpnst','9540/3','tumors of the cranial and paraspinal nerves';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'mpnst with perineuronal differentiation','9540/3','tumors of the cranial and paraspinal nerves';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'meningioma','9530/0','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'meningothelial meningioma','9531/0','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'fibrous meningioma','9532/0','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'transitional meningioma','9537/0','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'psammonatus meningioma','9533/0','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'angiomatous meningioma','9534/0','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'microcystic meningioma','9530/0','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'secretory meningioma','9530/0','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'lymphplastmacyte-rich meningioma','9530/0','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'metaplastic meningioma','9538/1','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'chordoid meningioma','9538/1','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'clear cell meningioma','9538/1','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'atypical meningioma','9539/1','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'papillary meningioma','9538/3','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'rhabdoid meningioma','9538/3','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'anaplastic (maglignant) meningioma','9530/3','meningiomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'solitary fibrous tumor / hemangiopericytoma grade 1','8815/0','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'solitary fibrous tumor / hemangiopericytoma grade 2','8815/1','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'solitary fibrous tumor / hemangiopericytoma grade 3','8815/3','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'hemangioblastoma','9161/1','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'hemangioma','9120/0','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'epithelioid hemangioendothelioma (9133/0)','9133/3','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'angiosarcoma','9120/3','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'kaposi sarcoma','9140/3','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'ewing sarcoma / pnet','9364/3','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'lipoma','8850/0','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'angiolipoma','8861/0','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'hibernoma','8880/0','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'liposarcoma','8850/3','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'desmoid-type fibromatosis','8821/1','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'myofibroblastoma','8825/0','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'inflammatory myofibroblastic tumor','8825/1','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'benign fibrous hstiocytoma','8830/0','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'fibrosarcoma','8810/3','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'undifferentiated pleomorphic sarcoma / milignant fibrous hstiocytoma','8802/3','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'leiomyoma','8890/0','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'leomyosarcoma','8900/3','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'rhabdomyoma','8900/0','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'rhabdomyosarcoma','8900/3','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'chondroma','9220/0','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'osteoma','9180/0','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'osteochondroma','9210/0','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'osteosarcoma','9180/3','mesenchymal and non-meningothelial tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'meningeal melanocytosis','8728/0','melancytic tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'meningeal melanocytoma','8728/1','melancytic tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'meningeal melanoma','8720/3','melancytic tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'meningeal melanomatosis','8728/3','melancytic tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'diffuse large b-cell lymphoma of the cns','9680/3','lymphomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'aids-related diffuse large b-cell lymphoma','','lymphomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'ebv-postive diffuse large b-cell lymphoma','','lymphomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'lymphomatoid granulomatosis','9766/1','lymphomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'intravascular b-cell lymphomas of the cns','9712/3','lymphomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'low-grade b-cell lymphomas of the cns','9712/3','lymphomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 't-cell and nt/t-cell lymphomas of the cns','9712/3','lymphomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'anaplastic large cell lymphoma, alk-positive','9714/3','lymphomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'anaplastic large cell lymphoma, alk-ngative','9702/3','lymphomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'malt lymphoma of the dura','9699/3','lymphomas';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'langerhans cell histiocytosis','9751/3','histicytic tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'erdheim-chester disease','9750/1','histicytic tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'rosai-dorfman disease','9750/1','histicytic tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'juvenile xanthogranuloma','9750/1','histicytic tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'histiocytic sarcoma','9755/3','histicytic tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'germinoma','9064/3','germ cell tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'embryonal carcinoma','9070/3','germ cell tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'yolk sac tumor','9071/3','germ cell tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'choriocarcinoma','9100/3','germ cell tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'teratoma','9080/1','germ cell tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'mature teratoma','9080/0','germ cell tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'immature teratoma','9080/3','germ cell tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'mixed germ cell tumor','9085/3','germ cell tumors';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'craniopharyngioma','9350/1','tumors of the sellar region';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'adamantinomatous craniopharyngioma','9351/1','tumors of the sellar region';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'papillary craniopharyngioma','9352/1','tumors of the sellar region';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'granular cell tumor of the sellar region','9582/0','tumors of the sellar region';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'pituicytoma','9432/1','tumors of the sellar region';
INSERT INTO icdo3_histologies (icdo3_description, icdo3_code, category) SELECT 'spindle cell oncocytoma','8290/0','tumors of the sellar region';

SELECT 'brain cancer'                                                              AS cohort
     , 'site'                                                                      AS target_variable
     , c.vocabulary_id                                                             AS source_vocabulary_id
     , c.concept_name                                                              AS source_concept_name
     , c.concept_code                                                              AS source_concept_code
     , c.domain_id                                                                 AS omop_domain_id
	   , c.vocabulary_id                                                             AS omop_vocabulary_id
	   , c.concept_name                                                              AS omop_concept_name
	   , c.concept_code                                                              AS omop_concept_code
     , c.concept_id                                                                AS omop_concept_id
     , 1                                                                           AS sequence
     ,'pre-coordinate with histology concept code and look up in Condition domain'  AS instructions
FROM concept c
WHERE c.vocabulary_id = 'ICDO3'
AND c.concept_code IN(
 'C70.0'
,'C70.1'
,'C70.9'
,'C71.0'
,'C71.1'
,'C71.2'
,'C71.3'
,'C71.4'
,'C71.5'
,'C71.6'
,'C71.7'
,'C71.8'
,'C71.9'
,'C72.0'
,'C72.1'
,'C72.2'
,'C72.3'
,'C72.4'
,'C72.5'
,'C72.8'
,'C72.9'
,'C75.1'
,'C75.2'
,'C75.3'
,'C41.0'
,'C41.1'
,'C41.2'
',C44.4'
)
UNION
SELECT 'brain cancer'           AS cohort
     , 'histology'              AS target_variable
     , c.vocabulary_id          AS source_vocabulary_id
     , ic3h.icdo3_description   AS source_concept_name
     , ic3h.icdo3_code          AS source_concept_code
     , c.domain_id              AS omop_domain_id
	   , c.vocabulary_id          AS omop_vocabulary_id
	   , c.concept_name           AS omop_concept_name
	   , c.concept_code           AS omop_concept_code
     , c.concept_id             AS omop_concept_id
     , 2                        AS sequence
     ,'pre-coordinate with site concept code and look up in Condition domain'  AS instructions
FROM icdo3_histologies ic3h LEFT JOIN concept c on ic3h.icdo3_code = c.concept_code and c.vocabulary_id = 'ICDO3'
WHERE c.vocabulary_id IS NOT NULL
AND ic3h.category IN(
 'diffuse astrocytic and oligodendroglial tumors'
,'other astrocytic tumors'
,'ependymal tumors'
,'other gliomas'
)
UNION
SELECT 'brain cancer'            AS cohort
      , 'WHO Grade'              AS target_variable
      , c1.vocabulary_id         AS source_vocabulary_id
      , c1.concept_name          AS source_concept_name
      , c1.concept_code          AS source_concept_code
      , c2.domain_id             AS omop_domain_id
      , c2.vocabulary_id         AS omop_vocabulary_id
      , c2.concept_name          AS omop_concept_name
      , c2.concept_code          AS omop_concept_code
      , c2.concept_id            AS omop_concept_id
      , 3                        AS sequence
      ,'modify parent entry in condition occurrence from pre-coordinated site/histology'  AS instructions
FROM concept c1 JOIN concept_relationship cr1 ON c1.concept_id = cr1.concept_id_1 AND c1.vocabulary_id = 'Cancer Modifier' AND cr1.relationship_id = 'Maps to'
                JOIN concept c2               ON cr1.concept_id_2 = c2.concept_id
WHERE c1.concept_name IN(
 'WHO Grade I'
,'WHO Grade II'
,'WHO Grade III'
,'WHO Grade IV'
)
ORDER BY cohort, sequence, omop_concept_code