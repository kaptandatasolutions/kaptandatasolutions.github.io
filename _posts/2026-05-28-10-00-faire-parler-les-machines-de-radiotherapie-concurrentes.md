---
layout: post
title: Podcast - Faire parler les machines de radiothérapie concurrentes
subtitle: Interopérabilité, standards DICOM et pipelines unifiés dans les services multi-constructeurs
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/unitRT.png
share-img: /assets/img/unitRT.png
tags: [Medical Physics, Radiotherapy, DICOM, Interoperability, Data Science, Quality Control, Automation, Linac]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

## 🎧 Nouveau podcast : Faire parler les machines de radiothérapie concurrentes 🎧

Dans un service de radiothérapie moderne, il est courant de trouver côte à côte des accélérateurs linéaires de fabricants différents et chacun avec son propre écosystème logiciel, ses formats propriétaires, ses exports DICOM légèrement divergents. Pour le physicien médical chargé du contrôle qualité, c'est un défi permanent : comment consolider les données, unifier les indicateurs de performance et maintenir un niveau de QA homogène sur une flotte hétérogène ?

Dans ce nouvel épisode de podcast, on explore les stratégies concrètes pour **faire "parler" des machines concurrentes entre elles**. Formats de données, middleware, pipelines Python, dashboards unifiés : découvrez comment passer d'une tour de Babel technologique à une architecture QA cohérente et pérenne.

🎙️ **Au programme** : le standard DICOM-RT et ses limites, les extensions propriétaires qui cassent l'interopérabilité, les patterns d'intégration éprouvés, et comment des outils open-source comme **pylinac**, **pydicom** et **n8n** peuvent servir de pont universel entre des systèmes qui ne se parlent pas nativement.

**Ne manquez pas cette discussion technique et pratique !**

---

🎧 **Écouter le podcast :**

<audio controls style="width: 100%; max-width: 600px;">
  <source src="/podcast_kds/Faire_parler_les_machines_de_radioth%C3%A9rapie_concurrentes.m4a" type="audio/mp4">
  Your browser does not support the audio element.
</audio>

---

![Linac multi-constructeur](/assets/img/unitRT.png)

---

📥 **Transcription du podcast**

---

# Podcast : Faire parler les machines de radiothérapie concurrentes

---

### Introduction

**Hôte 1** : Bienvenue dans ce nouvel épisode. Aujourd'hui, on s'attaque à un sujet qui concerne tous les services de radiothérapie modernes : comment gérer une flotte hétérogène d'accélérateurs linéaires, issus de constructeurs différents, dans un environnement où la donnée doit circuler librement pour garantir la qualité des traitements ?

**Hôte 2** : Absolument. Et ce n'est pas un problème anodin. Imaginez un service qui possède un Varian TrueBeam, un Elekta Versa HD et un ancien Siemens Oncor. Trois machines, trois systèmes de planification, trois formats d'export légèrement différents. C'est la réalité de beaucoup de centres en France et en Europe.

### Le problème de la tour de Babel technologique

**Hôte 1** : Commençons par le cœur du problème. DICOM-RT est censé être le standard universel dans la radiothérapie. Pourquoi est-ce que ça ne suffit pas ?

**Hôte 2** : C'est une excellente question. DICOM — Digital Imaging and Communications in Medicine — a été conçu comme un langage commun. En théorie, un plan de traitement exporté depuis Eclipse, le logiciel de Varian, devrait pouvoir être lu par Monaco d'Elekta, ou par n'importe quel système de record & verify. En pratique, les choses sont plus compliquées.

**Hôte 1** : Pourquoi cette complexité ? Le standard n'est-il pas suffisamment précis ?

**Hôte 2** : Le problème vient des **extensions propriétaires**. DICOM-RT définit des structures obligatoires et des structures optionnelles. Les fabricants remplissent les champs obligatoires, mais ils encodent souvent leurs informations spécifiques dans des tags privés — des champs réservés à leur usage exclusif. Un champ comme la fluence modifiée pour un traitement VMAT chez Varian peut être encodé différemment chez Elekta. Le résultat : les données sont là, mais elles ne se parlent pas.

### Les conséquences sur le contrôle qualité

**Hôte 1** : Concrètement, qu'est-ce que ça implique pour un physicien médical qui veut faire du contrôle qualité sur toute sa flotte ?

**Hôte 2** : Plusieurs problèmes critiques. D'abord, **les dashboards fragmentés** : chaque système a son propre outil de reporting, ses propres exports, ses propres graphiques. Pour avoir une vue d'ensemble de la performance de toutes les machines, le physicien doit jongler entre plusieurs logiciels, exporter des fichiers Excel manuellement, les fusionner à la main. C'est chronophage et source d'erreurs.

**Hôte 1** : Et ensuite ?

**Hôte 2** : Ensuite, il y a le problème de la **comparabilité des données**. Si vous voulez appliquer du Contrôle Statistique de Processus — du SPC — sur vos données de sortie dose, il faut que les mesures soient comparables entre machines. Or, si les incertitudes de calibration, les méthodes d'acquisition et les formats de stockage diffèrent, comparer une donnée Varian à une donnée Elekta revient à comparer des pommes et des oranges.

**Hôte 1** : On touche là à quelque chose de fondamental pour la sécurité des patients.

**Hôte 2** : Exactement. La qualité du traitement repose sur la cohérence des données. Si votre pipeline QA ne capture pas les dérives d'une machine parce qu'elle est dans un silo données distinct, vous avez un angle mort potentiellement dangereux.

### Les stratégies d'intégration

**Hôte 1** : Alors, comment on résout ça ? Quelles sont les approches qui fonctionnent vraiment en pratique ?

**Hôte 2** : Il y a plusieurs niveaux d'approche. Le premier, c'est ce qu'on appelle le **middleware**. Vous créez une couche logicielle intermédiaire qui intercepte les exports DICOM de chaque machine, les normalise dans un format commun, puis les injecte dans une base de données centrale. C'est l'approche la plus robuste, mais aussi la plus complexe à mettre en œuvre.

**Hôte 1** : Et sur le plan technique, comment ça se traduit ?

**Hôte 2** : En Python, vous utilisez **pydicom** pour lire et parser les fichiers DICOM. Vous créez des adaptateurs spécifiques pour chaque constructeur — un adaptateur Varian, un adaptateur Elekta, un adaptateur Siemens. Chaque adaptateur sait où trouver les informations critiques dans les tags privés de son constructeur, et les traduit dans votre schéma de données interne. Ensuite, tout le reste de votre pipeline — l'analyse, le reporting, les alertes — travaille sur ce format normalisé, agnostique du constructeur.

**Hôte 1** : C'est élégant. C'est le même principe que les pilotes d'imprimante dans un système d'exploitation.

**Hôte 2** : Exactement la bonne analogie ! Vous, en tant qu'utilisateur, vous imprimez un document. Vous ne vous souciez pas si c'est une HP ou une Canon. Le pilote fait la traduction. Notre middleware DICOM fait exactement ça pour les données de radiothérapie.

### Le rôle de pylinac dans un environnement multi-constructeurs

**Hôte 1** : Comment **pylinac** s'intègre dans tout ça ? C'est la librairie de référence pour l'analyse QA en radiothérapie.

**Hôte 2** : pylinac est un outil extraordinaire précisément parce qu'il est **constructeur-agnostique**. Qu'il s'agisse d'un film EPID acquis sur un Varian ou sur un Elekta, pylinac peut analyser les images de Starshot, de Picket Fence, de Winston-Lutz de manière identique. Il abstraie les différences d'acquisition matérielle.

**Hôte 1** : Mais il y a quand même des subtilités ?

**Hôte 2** : Oui. Certaines images nécessitent une inversion de pixel selon le constructeur — un Varian encode les hautes doses comme des pixels clairs, certains Elekta dans l'autre sens. pydicom vous permet de détecter le constructeur via les tags DICOM et d'appliquer automatiquement le traitement adapté avant de passer l'image à pylinac. C'est le genre de détail qui peut faire rater une analyse QA si vous ne l'avez pas pris en compte.

**Hôte 1** : Ce sont ces détails qui font la différence entre un outil qui fonctionne en laboratoire et un outil qui tient en production clinique.

**Hôte 2** : Absolument. Et c'est là où l'expérience du terrain est irremplaçable. La documentation des standards DICOM ne vous dit pas que tel constructeur encode le numéro de gantry en degrés allant dans un sens, et un autre dans l'autre. Ce genre de connaissance vient de l'expérience pratique, des incidents, des comparaisons terrain.

### L'orchestration avec n8n

**Hôte 1** : Parlons des outils d'orchestration. Vous mentionnez souvent **n8n** dans vos solutions. Quel rôle joue-t-il dans un environnement multi-constructeurs ?

**Hôte 2** : n8n est un outil d'automatisation de workflows qui s'avère extrêmement utile pour l'orchestration des pipelines QA multi-machines. Imaginez ce scénario : chaque nuit, vous voulez que votre système récupère automatiquement les données de traitement de la journée de chacun de vos accélérateurs — qu'ils soient Varian, Elekta ou Siemens —, les analyse avec pylinac, génère des rapports PDF, et envoie une alerte par email si une valeur dépasse un seuil de contrôle.

**Hôte 1** : Et n8n permet de construire ça visuellement, sans écrire tout le code de l'orchestration à la main ?

**Hôte 2** : Exactement. Vous définissez les nœuds : un nœud de collecte DICOM pour chaque machine, un nœud de normalisation, un nœud d'appel à votre API Python d'analyse, un nœud de génération de rapport, un nœud d'alerte. Et n8n gère l'exécution, les retry en cas d'échec, la gestion des erreurs. Vous avez une vue visuelle de tout votre pipeline QA — c'est à la fois plus maintenable et plus facile à auditer.

**Hôte 1** : C'est important dans un contexte médical, l'auditabilité.

**Hôte 2** : Critique. Les autorités de santé et les accréditations — que ce soit l'ASN en France, le CERN ou les normes ISO — exigent une traçabilité complète. Chaque analyse doit être documentée : qui a fait quoi, quand, avec quelles données d'entrée, quels résultats en sortie. n8n, combiné à une base de données structurée, vous donne cette traçabilité automatiquement.

### Le dashboard unifié : la pièce maîtresse

**Hôte 1** : Arrivons à ce qui est probablement l'objectif final : le dashboard unifié. Qu'est-ce que c'est concrètement ?

**Hôte 2** : Le dashboard unifié, c'est **la vue de contrôle mission** de votre service. Un seul écran — développé avec Streamlit par exemple — qui vous affiche en temps réel l'état de santé de toutes vos machines, leurs indicateurs de performance clés, les tendances sur les dernières semaines, les alertes actives. Et tout ça, quelle que soit la marque de l'accélérateur.

**Hôte 1** : Vous pouvez nous donner des exemples concrets d'indicateurs affichés ?

**Hôte 2** : Bien sûr. Vous avez d'abord les indicateurs **dosimétriques** : l'output dose journalier de chaque énergie — 6 MV, 10 MV, 15 MV — comparé à la valeur de référence, avec les cartes de contrôle SPC qui vous montrent si vous êtes dans les limites d'action ou d'alerte. Ensuite les indicateurs **géométriques** : résultats des tests Winston-Lutz qui vérifient l'isocentre, résultats Picket Fence qui vérifient les lames MLC, résultats Starshot pour la coïncidence radiation-mécanique.

**Hôte 1** : Et tout ça agrégé sur une seule interface pour plusieurs machines de marques différentes ?

**Hôte 2** : C'est l'ambition. Et c'est réalisable. La clé, c'est d'avoir investi en amont dans la normalisation des données — le middleware dont on parlait. Une fois que vos données sont dans un format commun, n'importe quel outil de visualisation peut les afficher de manière uniforme. Vous pouvez même faire des comparaisons inter-machines : est-ce que votre Varian TrueBeam est plus stable que votre Elekta Versa HD sur les six derniers mois ? Des questions impossibles à répondre quand les données sont dans des silos séparés.

### Les défis humains et organisationnels

**Hôte 1** : On a beaucoup parlé technique. Mais il y a aussi des défis humains et organisationnels dans ce type de projet ?

**Hôte 2** : Énormes. Souvent plus importants que les défis techniques, en fait. Le premier défi, c'est la **résistance au changement**. Les physiciens et les techniciens ont leurs habitudes, leurs outils. Introduire un nouveau pipeline centralisé, c'est remettre en question des workflows établis depuis des années. Il faut de la pédagogie, de la formation, et surtout montrer rapidement la valeur ajoutée.

**Hôte 1** : Qu'est-ce que vous recommandez pour adresser ce défi ?

**Hôte 2** : Commencer petit. Ne pas essayer de tout révolutionner en une fois. Choisissez un cas d'usage à fort impact visible — par exemple, automatiser la génération du rapport mensuel de contrôle qualité — et montrez que votre solution fonctionne, fait gagner du temps, et produit des résultats de meilleure qualité. Une victoire rapide et visible crée l'adhésion pour les étapes suivantes.

**Hôte 1** : Et le deuxième défi organisationnel ?

**Hôte 2** : La **gouvernance des données**. Qui est responsable de la qualité des données du pipeline ? Quand une anomalie est détectée, qui doit intervenir ? Comment les données sont-elles sauvegardées, sécurisées, conformément aux réglementations sur les données de santé — le RGPD en Europe, la HIPAA aux États-Unis ? Ces questions doivent être résolues avant de déployer un système en production clinique, pas après.

### Cas concret : unifier deux services après une fusion hospitalière

**Hôte 1** : Vous avez évoqué un cas concret qui illustre parfaitement tous ces enjeux. Vous pouvez en parler ?

**Hôte 2** : Oui, un cas classique que l'on rencontre de plus en plus dans le contexte des regroupements hospitaliers. Deux services de radiothérapie fusionnent — l'un équipé de Varian, l'autre d'Elekta. Du jour au lendemain, il faut harmoniser les pratiques, mais aussi les systèmes informatiques et les pipelines de données. C'est un défi énorme.

**Hôte 1** : Et concrètement, comment on approche ça ?

**Hôte 2** : La première étape, c'est l'**audit des données existantes**. Qu'est-ce qu'on a dans chaque système ? Quelles données sont exploitables, dans quel format, avec quelle qualité ? On fait un inventaire complet. Ensuite, on définit le **schéma de données cible** : à quoi doit ressembler notre table de données unifiée ? Quels sont les champs obligatoires, les champs optionnels ? Comment on gère les cas où une information existe dans un système mais pas dans l'autre ?

**Hôte 1** : Et l'implémentation technique ?

**Hôte 2** : On déploie les adaptateurs DICOM pour chaque constructeur, on met en place le pipeline d'ingestion automatique, on valide que les données normalisées correspondent bien aux données sources — étape critique de **validation croisée** — et ensuite seulement on bascule les équipes sur le nouveau dashboard unifié. En parallèle, on maintient les anciens systèmes pendant une période de transition pour que les équipes puissent vérifier que les résultats sont cohérents.

**Hôte 1** : C'est une approche très rigoureuse, qui ressemble à ce qu'on ferait dans une migration de système d'information classique.

**Hôte 2** : C'est exactement ça. La radiothérapie, malgré la spécificité médicale du domaine, obéit aux mêmes principes d'ingénierie informatique que n'importe quel système critique. Et c'est tant mieux, parce que ça signifie qu'on peut s'appuyer sur des méthodologies éprouvées — DevOps, CI/CD, tests automatisés, monitoring — pour construire des systèmes robustes et fiables.

### L'avenir : vers une interopérabilité native ?

**Hôte 1** : Pour terminer, est-ce qu'on peut espérer que ce problème d'interopérabilité se résoudra de lui-même dans le futur ? Avec des standards plus stricts, des constructeurs plus ouverts ?

**Hôte 2** : Il y a des signes encourageants. Le standard **FHIR** — Fast Healthcare Interoperability Resources — commence à faire son chemin dans l'imagerie médicale. Des initiatives comme **DICOMweb** facilitent l'échange de données DICOM via des API REST standard. Et la pression réglementaire sur l'interopérabilité des systèmes de santé — notamment en Europe avec l'Espace Européen des Données de Santé — va dans le bon sens.

**Hôte 1** : Mais ce n'est pas pour demain ?

**Hôte 2** : Pas pour les systèmes existants, non. Les parcs machine ont une durée de vie de 10 à 15 ans. Les accélérateurs installés aujourd'hui seront encore en service en 2035-2040. Donc les défis d'interopérabilité dont on parle aujourd'hui, ils resteront d'actualité pendant encore de nombreuses années. C'est pourquoi investir maintenant dans des pipelines de données robustes et des middleware bien conçus, c'est un investissement qui amortit sur le long terme.

**Hôte 1** : Une dernière question : quel serait votre conseil numéro un à un responsable de physique médicale qui commence à se pencher sur ce problème ?

**Hôte 2** : **Commencez par les données, pas par les outils.** Avant de choisir un logiciel, avant de déployer une solution clé en main, prenez le temps de comprendre vos données. Quelles données avez-vous ? Où sont-elles ? Quelle est leur qualité ? Qui en est responsable ? Une fois que vous avez ces réponses, les choix technologiques deviennent beaucoup plus clairs. Et n'ayez pas peur d'utiliser des outils open-source — pydicom, pylinac, Python, n8n — pour construire des solutions sur mesure qui répondent exactement à vos besoins cliniques. La communauté est là, les ressources existent, et le résultat sera bien plus adapté qu'un logiciel propriétaire générique.

**Hôte 1** : Excellent conseil. Merci pour cette discussion riche et très concrète. Pour nos auditeurs qui veulent aller plus loin, les ressources et les liens seront disponibles dans les notes de cet épisode.

**Hôte 2** : Merci à vous. Et n'oubliez pas : dans la radiothérapie, la qualité de la donnée, c'est la qualité du traitement. Prenez soin de vos données.

---

<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kaptan Data Solutions</title>
    <style>
        .citation {
            background-color: #f3e8ff;
            border-left: 4px solid #8b5cf6;
            padding: 20px;
            margin: 20px 0;
            border-radius: 8px;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            line-height: 1.6;
        }
        .citation h3 {
            color: #6b21a8;
            margin-top: 0;
        }
        .citation a {
            color: #7c3aed;
            text-decoration: none;
        }
        .citation a:hover {
            text-decoration: underline;
        }
        .expertise-list {
            margin: 15px 0;
        }
        .hashtags {
            font-weight: bold;
            color: #7c3aed;
            margin-top: 15px;
        }
    </style>
</head>
<body>
  <div class="citation">
    <h3>🔍 Découvrez Kaptan Data Solutions — votre partenaire data science & QA en physique médicale !</h3>

    <p>Startup française dédiée aux applications web innovantes pour la <strong>physique médicale et l'assurance qualité (QA)</strong>, nous accompagnons les centres de radiothérapie dans la maîtrise de leurs données et l'automatisation de leurs contrôles qualité.</p>

    <p>Notre mission : fournir aux hôpitaux, centres de cancérologie et laboratoires de dosimétrie des outils puissants, intuitifs et conformes qui rationalisent l'acquisition, l'analyse et le reporting des données faisceau — quelle que soit la marque de votre accélérateur.</p>

    <p>
      <a href="https://kaptandatasolutions.github.io/">🌐 Explorez tous nos services et actualités tech</a><br>
      <a href="https://kaptan-data-solutions.app/">💻 Testez nos dashboards QA en ligne</a><br>
      <a href="https://www.kaptan-data-solutions.app/upcoming_saas/">Notre SaaS de physique médicale arrive bientôt — conçu pour la radiothérapie, l'imagerie et la médecine nucléaire.</a>
    </p>

    <p><strong>Nos domaines d'expertise :</strong></p>
    <div class="expertise-list">
      📊 Dashboards interactifs pour le suivi de performance et l'analyse de tendances linac<br>
      🔬 Dosimétrie patient et QA image (EPID, dosimétrie portale) — multi-constructeurs<br>
      📈 Contrôle Statistique de Processus (SPC) et détection d'anomalies sur données faisceau<br>
      🤖 Workflows QA automatisés avec n8n + agents IA (maintenance prédictive)<br>
      📑 Reporting conforme DICOM-RT / HL7 et pistes d'audit réglementaires
    </div>

    <p>En exploitant l'analyse Python avancée et l'orchestration n8n, nous aidons les physiciens à automatiser les QA de routine, détecter les dérives précocement et générer des PDF réglementaires en un clic — sur une flotte homogène comme hétérogène.</p>

    <p>Prêt à améliorer la qualité de vos traitements et votre taux de disponibilité machine ? Parlons de vos défis multi-constructeurs et concevons une solution sur mesure !</p>

    <div class="hashtags">
      #MedicalPhysics #Radiotherapy #LinacQA #DICOM #Interoperability #DataScience #Automation
    </div>

    <p><a href="https://kaptandatasolutions.github.io/submit-project/">Demander un devis</a></p>
  </div>
</body>
</html>
