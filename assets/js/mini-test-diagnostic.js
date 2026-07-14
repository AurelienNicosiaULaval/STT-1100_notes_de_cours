(function () {
  "use strict";

  const READY_THRESHOLD = 0.8;
  const CONSOLIDATE_THRESHOLD = 0.6;

  const diagnosticConfig = {
    "01": {
      answers: ["false", "a", "true", "b", "true", "b", "a", "true"],
      competencies: [
        {
          id: "workflow",
          questions: [1, 2, 3, 8],
          fr: {
            label: "Travailler de façon reproductible avec R et Quarto",
            action: "Refaites un court rapport Quarto depuis une session R propre, puis rendez-le sans utiliser d'objet créé dans la console.",
            resources: [
              { label: "Notes et exemples: introduction à Quarto", href: "aventure.html#introduction-à-quarto" },
              { label: "Exercice 8: créer un premier rapport Quarto", href: "exercices.html#exercice-8---créer-un-premier-rapport-quarto" }
            ]
          },
          en: {
            label: "Work reproducibly with R and Quarto",
            action: "Rebuild a short Quarto report from a clean R session without using an object created in the console.",
            resources: [
              { label: "Notes and examples: introduction to Quarto", href: "aventure.html#introduction-to-quarto" },
              { label: "Exercise 8: create a first Quarto report", href: "exercices.html#exercise-8---create-a-first-quarto-report" }
            ]
          }
        },
        {
          id: "r_data",
          questions: [4, 5, 6, 7],
          fr: {
            label: "Manipuler des objets, des valeurs manquantes et des tableaux",
            action: "Reprenez les exemples de manipulation, puis écrivez un filtre et une sélection de colonnes sans copier le code.",
            resources: [
              { label: "Notes et code: manipulation de données", href: "aventure.html#manipulation-de-données" },
              { label: "Exercices 11 à 14: valeurs manquantes et manipulation", href: "exercices.html#exercice-11---repérer-les-valeurs-manquantes" }
            ]
          },
          en: {
            label: "Manipulate objects, missing values and tables",
            action: "Review the manipulation examples, then write one row filter and one column selection without copying code.",
            resources: [
              { label: "Notes and code: data manipulation", href: "aventure.html#data-manipulation" },
              { label: "Exercises 11 to 14: missing values and manipulation", href: "exercices.html#exercise-11---find-missing-values" }
            ]
          }
        }
      ]
    },
    "02": {
      answers: ["true", "b", "true", "b", "a", "b", "a", "false", "a", "a", "a", "false"],
      competencies: [
        {
          id: "project_import",
          questions: [1, 2, 3, 12],
          fr: {
            label: "Gérer le projet, GitHub et l'importation reproductible",
            action: "Importez un fichier depuis le projet, conservez le fichier brut et documentez l'étape dans le rapport avant de faire un commit.",
            resources: [
              { label: "Aventure: travail sur GitHub", href: "aventure.html#travail-sur-github" },
              { label: "Exercices, bloc A: GitHub, projet et importation", href: "exercices.html#bloc-a---github-projet-et-importation" }
            ]
          },
          en: {
            label: "Manage the project, GitHub and reproducible import",
            action: "Import a file from the project, preserve the raw file and document the step in the report before committing.",
            resources: [
              { label: "Adventure: working on GitHub", href: "aventure.html#working-on-github" },
              { label: "Exercises, block A: GitHub, project and import", href: "exercices.html#block-a---github-project-and-import" }
            ]
          }
        },
        {
          id: "dplyr",
          questions: [4, 5, 6, 7],
          fr: {
            label: "Inspecter, transformer et résumer avec dplyr",
            action: "Sur un petit tableau, enchaînez glimpse(), select(), mutate(), group_by() et summarise(), puis vérifiez le résultat.",
            resources: [
              { label: "Notes et exemples: manipulation de données", href: "aventure.html#manipulation-de-données" },
              { label: "Exercices, bloc B: manipuler avec dplyr", href: "exercices.html#bloc-b---manipuler-les-données-avec-dplyr" }
            ]
          },
          en: {
            label: "Inspect, transform and summarize with dplyr",
            action: "On a small table, combine glimpse(), select(), mutate(), group_by() and summarise(), then verify the result.",
            resources: [
              { label: "Notes and examples: data manipulation", href: "aventure.html#data-manipulation" },
              { label: "Exercises, block B: manipulate data with dplyr", href: "exercices.html#block-b---manipulate-data-with-dplyr" }
            ]
          }
        },
        {
          id: "visualization",
          questions: [8, 9, 10, 11],
          fr: {
            label: "Choisir et interpréter des résumés et visualisations",
            action: "Associez chaque type de variable au graphique approprié, puis produisez un histogramme, une boîte à moustaches et un nuage de points.",
            resources: [
              { label: "Notes et exemples: visualisation des données", href: "aventure.html#visualisation-des-données" },
              { label: "Exercices, bloc C: variables numériques", href: "exercices.html#bloc-c---visualiser-des-variables-numériques" }
            ]
          },
          en: {
            label: "Choose and interpret summaries and visualizations",
            action: "Match each variable type to a suitable graph, then produce a histogram, a box plot and a scatterplot.",
            resources: [
              { label: "Notes and examples: data visualization", href: "aventure.html#data-visualization" },
              { label: "Exercises, block C: numerical variables", href: "exercices.html#block-c---visualize-numerical-variables" }
            ]
          }
        }
      ]
    },
    "03": {
      answers: ["true", "a", "true", "a", "b", "a", "true", "a", "true", "a", "true", "c"],
      competencies: [
        {
          id: "strings",
          questions: [1, 2, 3, 4],
          fr: {
            label: "Reconnaître et nettoyer les catégories et les chaînes",
            action: "Harmonisez une variable textuelle, détectez un motif et extrayez une information avec stringr.",
            resources: [
              { label: "Notes et code: catégories et stringr", href: "aventure.html#variables-catégoriques-les-bases-en-r-avec-stringr" },
              { label: "Exercices, bloc B: chaînes et motifs", href: "exercices.html#bloc-b---chaînes-de-caractères-et-motifs" }
            ]
          },
          en: {
            label: "Recognize and clean categories and strings",
            action: "Standardize a text variable, detect a pattern and extract information with stringr.",
            resources: [
              { label: "Notes and code: categories and stringr", href: "aventure.html#categorical-variables-the-basics-in-r-with-stringr" },
              { label: "Exercises, block B: strings and patterns", href: "exercices.html#block-b---character-strings-and-patterns" }
            ]
          }
        },
        {
          id: "summaries",
          questions: [5, 6, 8, 10],
          fr: {
            label: "Transformer et résumer des variables catégoriques",
            action: "Créez une variable propre, comptez les modalités et documentez chaque choix de transformation dans le code.",
            resources: [
              { label: "Notes et exemples: statistiques descriptives catégoriques", href: "aventure.html#statistiques-descriptives-pour-variables-catégoriques" },
              { label: "Exercices, bloc A: fréquences et proportions", href: "exercices.html#bloc-a---variables-catégoriques-et-fréquences" }
            ]
          },
          en: {
            label: "Transform and summarize categorical variables",
            action: "Create a clean variable, count its levels and document each transformation choice in code.",
            resources: [
              { label: "Notes and examples: categorical descriptive statistics", href: "aventure.html#descriptive-statistics-for-categorical-variables" },
              { label: "Exercises, block A: frequencies and proportions", href: "exercices.html#block-a---categorical-variables-and-frequencies" }
            ]
          }
        },
        {
          id: "communication",
          questions: [7, 9, 11, 12],
          fr: {
            label: "Visualiser et communiquer des catégories avec prudence",
            action: "Produisez un graphique de proportions avec les effectifs, ordonnez les catégories et rédigez un chiffre narratif vérifiable.",
            resources: [
              { label: "Notes et démonstration: visualisation catégorique", href: "aventure.html#visualisation-de-données-catégoriques" },
              { label: "Exercices, bloc D: visualiser des catégories", href: "exercices.html#bloc-d---visualiser-des-catégories" }
            ]
          },
          en: {
            label: "Visualize and communicate categories carefully",
            action: "Produce a proportion chart with counts, order categories and write one verifiable narrative figure.",
            resources: [
              { label: "Notes and demonstration: categorical visualization", href: "aventure.html#categorical-data-visualization" },
              { label: "Exercises, block D: visualize categories", href: "exercices.html#block-d---visualize-categories" }
            ]
          }
        }
      ]
    },
    "04": {
      answers: ["false", "a", "true", "a", "a", "false", "a", "true", "a", "true", "d", "a"],
      competencies: [
        {
          id: "import_types",
          questions: [1, 2, 3, 9],
          fr: {
            label: "Importer des données et contrôler leur structure",
            action: "Importez un fichier avec le séparateur et les types appropriés, puis vérifiez les noms, dimensions et identifiants.",
            resources: [
              { label: "Notes et code: importation des données", href: "aventure.html#importation-des-données" },
              { label: "Exercices, bloc A: importer et inspecter", href: "exercices.html#bloc-a---importer-et-inspecter" }
            ]
          },
          en: {
            label: "Import data and control its structure",
            action: "Import a file with the appropriate delimiter and types, then check names, dimensions and identifiers.",
            resources: [
              { label: "Notes and code: data import", href: "aventure.html#data-import" },
              { label: "Exercises, block A: import and inspect", href: "exercices.html#block-a---import-and-inspect" }
            ]
          }
        },
        {
          id: "transform",
          questions: [4, 5, 7, 8],
          fr: {
            label: "Nettoyer les valeurs, facteurs et structures imbriquées",
            action: "Remplacez un code manquant, remodelez un tableau, regroupez des modalités et rectangularisez une structure simple.",
            resources: [
              { label: "Notes et exemples: nettoyage avec forcats", href: "aventure.html#nettoyage-des-facteurs-avec-forcats" },
              { label: "Exercices, bloc B: nettoyer valeurs et catégories", href: "exercices.html#bloc-b---nettoyer-valeurs-et-catégories" }
            ]
          },
          en: {
            label: "Clean values, factors and nested structures",
            action: "Replace a missing-value code, reshape a table, group levels and rectangularize a simple structure.",
            resources: [
              { label: "Notes and examples: factor cleaning with forcats", href: "aventure.html#cleaning-factors-with-forcats" },
              { label: "Exercises, block B: clean values and categories", href: "exercices.html#block-b---clean-values-and-categories" }
            ]
          }
        },
        {
          id: "quality_log",
          questions: [6, 10, 11, 12],
          fr: {
            label: "Documenter et vérifier les décisions de nettoyage",
            action: "Créez un journal de nettoyage, signalez une anomalie sans la deviner et sauvegardez le résultat produit par le code.",
            resources: [
              { label: "Notes: recette de nettoyage approfondie", href: "aventure.html#recette-de-nettoyage-approfondissement" },
              { label: "Exercices, bloc C: documenter un nettoyage", href: "exercices.html#bloc-c---documenter-un-nettoyage" }
            ]
          },
          en: {
            label: "Document and verify cleaning decisions",
            action: "Create a cleaning log, flag an anomaly without guessing a correction and save the output produced by code.",
            resources: [
              { label: "Notes: cleaning recipe deep dive", href: "aventure.html#cleaning-recipe-deep-dive" },
              { label: "Exercises, block C: document cleaning", href: "exercices.html#block-c---document-cleaning" }
            ]
          }
        }
      ]
    },
    "05": {
      answers: ["false", "a", "false", "a", "true", "a", "true", "a", "false", "b", "true", "a"],
      competencies: [
        {
          id: "dates_quality",
          questions: [1, 2, 7, 8],
          fr: {
            label: "Explorer les données, les dates et les valeurs manquantes",
            action: "Créez une date, extrayez le jour de la semaine et vérifiez les valeurs manquantes avant tout résumé.",
            resources: [
              { label: "Notes et code: dates avec lubridate", href: "aventure.html#comprendre-et-manipuler-les-dates-avec-lubridate" },
              { label: "Exercices, bloc A: dates et valeurs manquantes", href: "exercices.html#bloc-a---dates-structure-et-valeurs-manquantes" }
            ]
          },
          en: {
            label: "Explore data, dates and missing values",
            action: "Create a date, extract the day of the week and check missing values before producing a summary.",
            resources: [
              { label: "Notes and code: dates with lubridate", href: "aventure.html#understand-and-manipulate-dates-with-lubridate" },
              { label: "Exercises, block A: dates and missing values", href: "exercices.html#block-a---dates-structure-and-missing-values" }
            ]
          }
        },
        {
          id: "associations",
          questions: [3, 4, 6, 9],
          fr: {
            label: "Étudier des associations et leurs limites",
            action: "Calculez une corrélation sur les cas complets, tracez le nuage de points et décrivez ce que la tendance ne montre pas.",
            resources: [
              { label: "Notes: explorer les relations entre les données", href: "aventure.html#explorer-et-comprendre-les-relations-entre-les-données" },
              { label: "Exercices, bloc B: associations et visualisations", href: "exercices.html#bloc-b---associations-et-visualisations" }
            ]
          },
          en: {
            label: "Study associations and their limits",
            action: "Compute a correlation on complete cases, draw a scatterplot and describe what the trend does not show.",
            resources: [
              { label: "Notes: explore relationships between data", href: "aventure.html#explore-and-understand-relationships-between-data" },
              { label: "Exercises, block B: associations and visualizations", href: "exercices.html#block-b---associations-and-visualizations" }
            ]
          }
        },
        {
          id: "interpretation",
          questions: [5, 10, 11, 12],
          fr: {
            label: "Interpréter et communiquer une exploration avec prudence",
            action: "Ajoutez les effectifs, vérifiez les titres et axes, puis rédigez une conclusion descriptive sans causalité non appuyée.",
            resources: [
              { label: "Aventure: analyses guidées et interprétation", href: "aventure.html#analyse-3---les-vieux-avions-sont-ils-moins-fiables" },
              { label: "Exercices, bloc C: interprétation prudente", href: "exercices.html#bloc-c---interprétation-prudente" }
            ]
          },
          en: {
            label: "Interpret and communicate an exploration carefully",
            action: "Add group counts, check titles and axes, then write a descriptive conclusion without unsupported causality.",
            resources: [
              { label: "Adventure: guided analyses and interpretation", href: "aventure.html#analysis-3---are-old-planes-less-reliable" },
              { label: "Exercises, block C: cautious interpretation", href: "exercices.html#block-c---cautious-interpretation" }
            ]
          }
        }
      ]
    },
    "06": {
      answers: ["true", "a", "false", "a", "false", "a", "false", "a", "false", "a", "true", "b"],
      competencies: [
        {
          id: "collaboration",
          questions: [1, 5, 8, 12],
          fr: {
            label: "Collaborer et formuler une revue actionnable",
            action: "Rédigez une issue qui nomme le fichier, l'observation, l'effet et une suggestion concrète.",
            resources: [
              { label: "Aventure: collaboration avec GitHub", href: "aventure.html#partie-1---collaboration-avec-github" },
              { label: "Exercices, bloc C: issues et revue constructive", href: "exercices.html#bloc-c---issues-et-revue-constructive" }
            ]
          },
          en: {
            label: "Collaborate and write actionable review feedback",
            action: "Write an issue that names the file, observation, effect and one concrete suggestion.",
            resources: [
              { label: "Adventure: collaboration with GitHub", href: "aventure.html#part-1---collaboration-with-github" },
              { label: "Exercises, block C: issues and constructive review", href: "exercices.html#block-c---issues-and-constructive-review" }
            ]
          }
        },
        {
          id: "joins",
          questions: [2, 3, 4, 10, 11],
          fr: {
            label: "Choisir, diagnostiquer et interpréter des jointures",
            action: "Sur deux petites tables, comparez left_join(), inner_join(), anti_join() et semi_join(), puis vérifiez les clés et le nombre de lignes.",
            resources: [
              { label: "Aventure: analyse avec données fusionnées", href: "aventure.html#partie-2---analyse-reproductible-avec-données-fusionnées" },
              { label: "Exercices, bloc A: comprendre les clés", href: "exercices.html#bloc-a---comprendre-les-clés-de-jointure" }
            ]
          },
          en: {
            label: "Choose, diagnose and interpret joins",
            action: "On two small tables, compare left_join(), inner_join(), anti_join() and semi_join(), then check keys and row counts.",
            resources: [
              { label: "Adventure: analysis with joined data", href: "aventure.html#part-2---reproducible-analysis-with-joined-data" },
              { label: "Exercises, block A: understand join keys", href: "exercices.html#block-a---understand-join-keys" }
            ]
          }
        },
        {
          id: "reproducibility",
          questions: [6, 7, 9],
          fr: {
            label: "Vérifier le rapport et le flux de travail reproductible",
            action: "Rendez le rapport depuis une session propre, vérifiez les fichiers attendus et documentez toute résolution de conflit.",
            resources: [
              { label: "Aventure: vérification finale", href: "aventure.html#vérification-finale" },
              { label: "Exercices, bloc B: résumer et vérifier le travail", href: "exercices.html#bloc-b---résumer-un-travail-collaboratif" }
            ]
          },
          en: {
            label: "Verify the report and reproducible workflow",
            action: "Render the report from a clean session, check expected files and document any conflict resolution.",
            resources: [
              { label: "Adventure: final check", href: "aventure.html#final-check" },
              { label: "Exercises, block B: summarize and verify work", href: "exercices.html#block-b---summarize-collaborative-work" }
            ]
          }
        }
      ]
    },
    "07": {
      answers: ["true", "a", "false", "a", "true", "a", "false", "a", "true", "b", "true", "b"],
      competencies: [
        {
          id: "visual_integrity",
          questions: [1, 2, 7, 11],
          fr: {
            label: "Construire une visualisation honnête et interprétable",
            action: "Comparez deux axes, affichez les effectifs et justifiez le choix de la palette et de la conclusion descriptive.",
            resources: [
              { label: "Aventure: audit du rapport problématique", href: "aventure.html#partie-1---audit-du-rapport-problématique" },
              { label: "Exercices, bloc A: diagnostiquer une visualisation", href: "exercices.html#bloc-a---diagnostiquer-une-visualisation" }
            ]
          },
          en: {
            label: "Build an honest and interpretable visualization",
            action: "Compare two axes, display counts and justify the palette and descriptive conclusion.",
            resources: [
              { label: "Adventure: audit the problematic report", href: "aventure.html#part-1---audit-the-problematic-report" },
              { label: "Exercises, block A: diagnose a visualization", href: "exercices.html#block-a---diagnose-a-visualization" }
            ]
          }
        },
        {
          id: "privacy",
          questions: [3, 4, 5, 6, 10],
          fr: {
            label: "Réduire les risques d'identification et de ré-identification",
            action: "Repérez les identifiants directs et quasi-identifiants, puis masquez ou regroupez les petits effectifs avant tout partage.",
            resources: [
              { label: "Aventure: préparation responsable des données", href: "aventure.html#partie-2---préparation-responsable-des-données" },
              { label: "Exercices, bloc B: réduire les risques", href: "exercices.html#bloc-b---réduire-les-risques-de-ré-identification" }
            ]
          },
          en: {
            label: "Reduce identification and re-identification risks",
            action: "Identify direct and quasi-identifiers, then suppress or group small counts before sharing.",
            resources: [
              { label: "Adventure: responsible data preparation", href: "aventure.html#part-2---responsible-data-preparation" },
              { label: "Exercises, block B: reduce re-identification risks", href: "exercices.html#block-b---reduce-re-identification-risks" }
            ]
          }
        },
        {
          id: "responsible_communication",
          questions: [8, 9, 12],
          fr: {
            label: "Communiquer les limites et les conditions de réutilisation",
            action: "Rédigez une courte note qui nomme les limites, le contexte des données et ce qui peut être publié ou réutilisé.",
            resources: [
              { label: "Aventure: note éthique", href: "aventure.html#partie-4---note-éthique" },
              { label: "Étude de cas: publication municipale responsable", href: "exercices.html#étude-de-cas-1---publication-municipale-responsable" }
            ]
          },
          en: {
            label: "Communicate limits and reuse conditions",
            action: "Write a short note naming the limitations, data context and what may be published or reused.",
            resources: [
              { label: "Adventure: ethics note", href: "aventure.html#part-4---ethics-note" },
              { label: "Case study: responsible municipal publication", href: "exercices.html#case-study-1---responsible-municipal-publication" }
            ]
          }
        }
      ]
    },
    "08": {
      answers: ["a", "true", "a", "false", "a", "true", "a", "false", "a", "true", "a", "true"],
      competencies: [
        {
          id: "extract",
          questions: [1, 2, 3, 12],
          fr: {
            label: "Lire et extraire une page HTML de façon reproductible",
            action: "Sur la page locale, ciblez un élément avec un sélecteur CSS, extrayez son texte et vérifiez que le résultat reste reproductible.",
            resources: [
              { label: "Notes et code: web scraping avec rvest", href: "aventure.html#comprendre-le-web-scraping-avec-rvest" },
              { label: "Exercices, bloc A: lire une page HTML locale", href: "exercices.html#bloc-a---lire-une-page-html-locale" }
            ]
          },
          en: {
            label: "Read and extract a local HTML page reproducibly",
            action: "On the local page, target an element with a CSS selector, extract its text and verify that the result remains reproducible.",
            resources: [
              { label: "Notes and code: web scraping with rvest", href: "aventure.html#understanding-web-scraping-with-rvest" },
              { label: "Exercises, block A: read a local HTML page", href: "exercices.html#block-a---read-a-local-html-page" }
            ]
          }
        },
        {
          id: "functions_tests",
          questions: [4, 5, 6, 7, 10],
          fr: {
            label: "Écrire une fonction d'extraction robuste et testable",
            action: "Transformez l'extraction en fonction, prévoyez les champs manquants et testez explicitement le contrat de sortie.",
            resources: [
              { label: "Aventure: création de scrape_page()", href: "aventure.html#création-guidée-de-la-fonction-scrape_page" },
              { label: "Exercices, bloc B: transformer l'extraction en fonction", href: "exercices.html#bloc-b---transformer-lextraction-en-fonction" }
            ]
          },
          en: {
            label: "Write a robust and testable extraction function",
            action: "Turn the extraction into a function, handle missing fields and explicitly test the output contract.",
            resources: [
              { label: "Adventure: create scrape_page()", href: "aventure.html#guided-creation-of-the-scrape_page-function" },
              { label: "Exercises, block B: turn extraction into a function", href: "exercices.html#block-b---turn-extraction-into-a-function" }
            ]
          }
        },
        {
          id: "ethics",
          questions: [8, 9, 11],
          fr: {
            label: "Collecter sobrement et vérifier les droits et le contexte",
            action: "Avant une collecte, vérifiez le contexte, limitez les requêtes, ajoutez des pauses et documentez les conditions de réutilisation.",
            resources: [
              { label: "Aventure: vérifier le contexte avant de scraper", href: "aventure.html#avant-de-scraper-vérifier-le-contexte" },
              { label: "Exercices, bloc C: sobriété et éthique", href: "exercices.html#bloc-c---sobriété-et-éthique-de-collecte" }
            ]
          },
          en: {
            label: "Collect sparingly and check rights and context",
            action: "Before collecting, check the context, limit requests, add pauses and document reuse conditions.",
            resources: [
              { label: "Adventure: check context before scraping", href: "aventure.html#before-scraping-check-the-context" },
              { label: "Exercises, block C: collection sobriety and ethics", href: "exercices.html#block-c---collection-sobriety-and-ethics" }
            ]
          }
        }
      ]
    },
    "09": {
      answers: ["a", "false", "a", "a", "a", "true", "a", "false", "false", "a", "true", "a"],
      competencies: [
        {
          id: "regression",
          questions: [1, 2, 3, 7],
          fr: {
            label: "Ajuster et interpréter une régression sans confondre association et causalité",
            action: "Ajustez un modèle simple, interprétez une pente dans son contexte et écrivez explicitement ce qui ne permet pas une conclusion causale.",
            resources: [
              { label: "Aventure: modèle de régression", href: "aventure.html#étape-2-modèle-de-régression" },
              { label: "Exercices, bloc A: relation linéaire", href: "exercices.html#bloc-a---explorer-une-relation-linéaire" }
            ]
          },
          en: {
            label: "Fit and interpret regression without confusing association and causality",
            action: "Fit a simple model, interpret one slope in context and state explicitly why it does not establish causality.",
            resources: [
              { label: "Adventure: regression model", href: "aventure.html#step-2-regression-model" },
              { label: "Exercises, block A: linear relationship", href: "exercices.html#block-a---explore-a-linear-relationship" }
            ]
          }
        },
        {
          id: "prediction",
          questions: [4, 5, 6, 8],
          fr: {
            label: "Produire et diagnostiquer des prédictions",
            action: "Produisez des prédictions, calculez les erreurs selon la convention du module et repérez toute extrapolation ou variable manquante.",
            resources: [
              { label: "Aventure: prédictions ciblées et limites", href: "aventure.html#étape-3-prédictions-ciblées" },
              { label: "Exercices, bloc B: prédire et diagnostiquer", href: "exercices.html#bloc-b---prédire-et-diagnostiquer" }
            ]
          },
          en: {
            label: "Produce and diagnose predictions",
            action: "Produce predictions, compute errors using the module convention and identify extrapolation or missing predictors.",
            resources: [
              { label: "Adventure: targeted predictions and limits", href: "aventure.html#step-3-targeted-predictions" },
              { label: "Exercises, block B: predict and diagnose", href: "exercices.html#block-b---predict-and-diagnose" }
            ]
          }
        },
        {
          id: "bias",
          questions: [9, 10, 11, 12],
          fr: {
            label: "Examiner un biais descriptif et formuler une conclusion responsable",
            action: "Comparez les groupes, ajoutez les variables de contexte disponibles et rédigez une conclusion qui nomme les limites.",
            resources: [
              { label: "Aventure: détection d'un biais descriptif", href: "aventure.html#mission-2-détection-dun-biais-descriptif" },
              { label: "Exercices, bloc C: examiner un biais descriptif", href: "exercices.html#bloc-c---examiner-un-biais-descriptif" }
            ]
          },
          en: {
            label: "Examine descriptive bias and write a responsible conclusion",
            action: "Compare groups, add available context variables and write a conclusion that states the limitations.",
            resources: [
              { label: "Adventure: detecting descriptive bias", href: "aventure.html#mission-2-detecting-a-descriptive-bias" },
              { label: "Exercises, block C: examine descriptive bias", href: "exercices.html#block-c---examine-descriptive-bias" }
            ]
          }
        }
      ]
    },
    "10": {
      answers: ["a", "a", "true", "a", "false", "a", "a", "false", "a", "true", "a", "true"],
      competencies: [
        {
          id: "tidy_text",
          questions: [1, 2, 3],
          fr: {
            label: "Préparer un texte en format tidy",
            action: "Tokenisez une colonne de commentaires, retirez les stopwords et vérifiez la structure du tableau obtenu.",
            resources: [
              { label: "Aventure: nettoyage de texte", href: "aventure.html#étape-1-nettoyage-de-texte" },
              { label: "Exercices, bloc A: transformer en tokens", href: "exercices.html#bloc-a---transformer-des-commentaires-en-tokens" }
            ]
          },
          en: {
            label: "Prepare text in tidy format",
            action: "Tokenize a comments column, remove stopwords and check the structure of the resulting table.",
            resources: [
              { label: "Adventure: text cleanup", href: "aventure.html#step-1-text-cleanup" },
              { label: "Exercises, block A: turn comments into tokens", href: "exercices.html#block-a---turn-comments-into-tokens" }
            ]
          }
        },
        {
          id: "text_indicators",
          questions: [4, 5, 6, 7, 8],
          fr: {
            label: "Construire et interpréter des indicateurs textuels exploratoires",
            action: "Calculez un score de sentiment et un TF-IDF, puis documentez les limites du lexique et de chaque indicateur.",
            resources: [
              { label: "Aventure: sentiment et mots distinctifs", href: "aventure.html#étape-2-analyse-de-sentiment" },
              { label: "Exercices, blocs B et C: sentiment et TF-IDF", href: "exercices.html#bloc-b---construire-un-score-de-sentiment-simple" }
            ]
          },
          en: {
            label: "Build and interpret exploratory text indicators",
            action: "Compute a sentiment score and TF-IDF, then document the limits of the lexicon and each indicator.",
            resources: [
              { label: "Adventure: sentiment and distinctive words", href: "aventure.html#step-2-sentiment-analysis" },
              { label: "Exercises, blocks B and C: sentiment and TF-IDF", href: "exercices.html#block-b---build-a-simple-sentiment-score" }
            ]
          }
        },
        {
          id: "dashboard",
          questions: [9, 10, 11, 12],
          fr: {
            label: "Concevoir un tableau de bord utile, prudent et confidentiel",
            action: "Ajoutez un filtre utile, vérifiez l'absence d'information identifiable et rédigez une conclusion avec limites et action réaliste.",
            resources: [
              { label: "Aventure: création du dashboard", href: "aventure.html#étape-4-création-du-dashboard" },
              { label: "Exercices, bloc D: sortie de tableau de bord", href: "exercices.html#bloc-d---préparer-une-sortie-de-tableau-de-bord" }
            ]
          },
          en: {
            label: "Design a useful, careful and confidential dashboard",
            action: "Add a useful filter, check that no one is identifiable and write a conclusion with limitations and a realistic action.",
            resources: [
              { label: "Adventure: creating the dashboard", href: "aventure.html#step-4-creating-the-dashboard" },
              { label: "Exercises, block D: dashboard output", href: "exercices.html#block-d---prepare-dashboard-output" }
            ]
          }
        }
      ]
    }
  };

  const ui = {
    fr: {
      answered: (answered, total) => `${answered} question${answered > 1 ? "s" : ""} répondue${answered > 1 ? "s" : ""} sur ${total}`,
      trueLabel: "Vrai",
      falseLabel: "Faux",
      submit: "Calculer mon bilan",
      retake: "Refaire le diagnostic",
      clear: "Effacer mes données locales",
      copy: "Copier mon bilan",
      copied: "Bilan copié",
      copyFailed: "Copie impossible",
      unanswered: (count) => `Il reste ${count} question${count > 1 ? "s" : ""} sans réponse. Complétez-${count > 1 ? "les" : "la"} avant de calculer le bilan.`,
      correct: "Réponse correcte",
      incorrect: "Réponse à revoir",
      selected: "Votre choix",
      expected: "Réponse attendue",
      nextAction: "Prochaine action",
      correctAction: "Poursuivez le diagnostic. Le bilan final confirmera si cette compétence demande tout de même une consolidation.",
      resultsHeading: "Votre bilan diagnostique",
      attempt: (number) => `Tentative ${number}`,
      globalResult: "Résultat global",
      competenceResults: "Bilan par compétence",
      competence: "Compétence",
      result: "Résultat",
      interpretation: "Interprétation",
      resources: "Ressources ciblées",
      recommendedActions: "Plan de révision ciblé",
      ready: "Bases prêtes pour poursuivre",
      consolidate: "Consolidation conseillée",
      priority: "Révision prioritaire",
      readyMessage: "Le résultat global et le bilan par compétence indiquent que les bases évaluées sont prêtes pour la suite. Passez à l'aventure du module et revenez aux ressources ciblées si une tâche pratique demeure difficile.",
      consolidateMessage: "Les bases sont présentes, mais certaines compétences gagneraient à être consolidées. Travaillez les ressources indiquées, refaites les exercices proposés, puis reprenez le diagnostic.",
      priorityMessage: "Plusieurs éléments essentiels doivent être revus avant de poursuivre. Commencez par les compétences en révision prioritaire, réalisez les actions proposées, puis reprenez le diagnostic sans consulter la correction.",
      thresholdNote: "Repères pédagogiques STT-1100: 80 % ou plus, bases prêtes; de 60 % à 79 %, consolidation conseillée; moins de 60 %, révision prioritaire. Un résultat global élevé est ramené à consolidation si une compétence demeure sous 60 %. Ces repères n'ont pas fait l'objet d'une validation psychométrique.",
      noWeakness: "Aucune compétence n'exige de révision ciblée selon ces repères. Passez à l'aventure et vérifiez vos acquis dans le travail pratique.",
      storageActive: "La progression et l'historique des tentatives sont conservés uniquement dans ce navigateur. Aucune réponse n'est transmise.",
      storageUnavailable: "Le stockage local est indisponible. Le diagnostic fonctionne, mais la progression disparaîtra à la fermeture de la page.",
      restored: "Une tentative inachevée conservée dans ce navigateur a été restaurée.",
      cleared: "Les réponses et l'historique local de ce diagnostic ont été effacés.",
      summaryTitle: (module) => `Autodiagnostic du module ${Number(module)} - STT-1100`
    },
    en: {
      answered: (answered, total) => `${answered} question${answered === 1 ? "" : "s"} answered out of ${total}`,
      trueLabel: "True",
      falseLabel: "False",
      submit: "Calculate my diagnostic",
      retake: "Retake the diagnostic",
      clear: "Delete my local data",
      copy: "Copy my diagnostic",
      copied: "Diagnostic copied",
      copyFailed: "Unable to copy",
      unanswered: (count) => `${count} question${count === 1 ? " remains" : "s remain"} unanswered. Complete ${count === 1 ? "it" : "them"} before calculating the diagnostic.`,
      correct: "Correct answer",
      incorrect: "Answer to review",
      selected: "Your choice",
      expected: "Expected answer",
      nextAction: "Next action",
      correctAction: "Continue the diagnostic. The final summary will confirm whether this competency still needs consolidation.",
      resultsHeading: "Your diagnostic summary",
      attempt: (number) => `Attempt ${number}`,
      globalResult: "Overall result",
      competenceResults: "Results by competency",
      competence: "Competency",
      result: "Result",
      interpretation: "Interpretation",
      resources: "Targeted resources",
      recommendedActions: "Targeted review plan",
      ready: "Foundations ready to continue",
      consolidate: "Consolidation advised",
      priority: "Priority review",
      readyMessage: "The overall result and competency profile indicate that the assessed foundations are ready for the next step. Continue to the module adventure and return to the targeted resources if a practical task remains difficult.",
      consolidateMessage: "The foundations are present, but some competencies would benefit from consolidation. Work through the suggested resources, redo the exercises and then retake the diagnostic.",
      priorityMessage: "Several essential elements should be reviewed before continuing. Start with the priority competencies, complete the suggested actions and then retake the diagnostic without consulting the correction.",
      thresholdNote: "STT-1100 pedagogical guideposts: 80% or more, foundations ready; 60% to 79%, consolidation advised; below 60%, priority review. A high overall result is classified as consolidation if any competency remains below 60%. These guideposts have not undergone psychometric validation.",
      noWeakness: "No competency requires targeted review under these guideposts. Continue to the adventure and verify your knowledge through practical work.",
      storageActive: "Progress and attempt history are stored only in this browser. No answer is transmitted.",
      storageUnavailable: "Local storage is unavailable. The diagnostic works, but progress will disappear when the page is closed.",
      restored: "An unfinished attempt stored in this browser has been restored.",
      cleared: "The answers and local history for this diagnostic have been deleted.",
      summaryTitle: (module) => `Module ${Number(module)} diagnostic - STT-1100`
    }
  };

  function createElement(tag, className, text) {
    const element = document.createElement(tag);
    if (className) element.className = className;
    if (text !== undefined) element.textContent = text;
    return element;
  }

  function percentage(value) {
    return Math.round(value * 100);
  }

  function stateForRatio(ratio) {
    if (ratio >= READY_THRESHOLD) return "ready";
    if (ratio >= CONSOLIDATE_THRESHOLD) return "consolidate";
    return "priority";
  }

  function findCompetency(config, questionNumber) {
    return config.competencies.find((competency) => competency.questions.includes(questionNumber));
  }

  function safeStorage() {
    try {
      const key = "stt1100-diagnostic-storage-test";
      window.localStorage.setItem(key, "1");
      window.localStorage.removeItem(key);
      return window.localStorage;
    } catch (error) {
      return null;
    }
  }

  function initialiseDiagnostic(marker) {
    const moduleId = marker.dataset.module;
    const lang = marker.dataset.lang === "en" ? "en" : "fr";
    const config = diagnosticConfig[moduleId];
    const labels = ui[lang];

    if (!config) return;

    const parent = marker.parentElement;
    const questionSections = Array.from(parent.querySelectorAll(":scope > section.level2"))
      .filter((section) => /^question-\d+$/.test(section.id));

    if (questionSections.length !== config.answers.length) {
      marker.textContent = lang === "fr"
        ? "Le diagnostic ne peut pas être initialisé: la banque de questions et la clé de correction ne concordent pas."
        : "The diagnostic cannot be initialized: the question bank and answer key do not match.";
      marker.classList.add("diagnostic-initialisation-error");
      return;
    }

    const competencies = config.competencies.map((competency) => ({
      id: competency.id,
      questions: competency.questions,
      ...competency[lang]
    }));
    const storage = safeStorage();
    const storageKey = `stt1100:mini-test-diagnostic:v1:${lang}:${moduleId}`;
    let state = { answers: {}, attempts: [] };
    let graded = false;
    let latestSummary = "";

    if (storage) {
      try {
        const saved = JSON.parse(storage.getItem(storageKey));
        if (saved && typeof saved === "object") {
          state.answers = saved.answers && typeof saved.answers === "object" ? saved.answers : {};
          state.attempts = Array.isArray(saved.attempts) ? saved.attempts : [];
        }
      } catch (error) {
        state = { answers: {}, attempts: [] };
      }
    }

    const shell = createElement("section", "diagnostic-shell");
    shell.dataset.diagnosticReady = "";
    shell.setAttribute("aria-label", labels.summaryTitle(moduleId));

    const storageNotice = createElement("p", "diagnostic-storage-notice", storage ? labels.storageActive : labels.storageUnavailable);
    const progressWrap = createElement("div", "diagnostic-progress-wrap");
    const progressText = createElement("p", "diagnostic-progress-text");
    const progress = createElement("progress", "diagnostic-progress");
    progress.max = questionSections.length;
    progress.value = 0;
    progress.setAttribute("aria-label", lang === "fr" ? "Progression du diagnostic" : "Diagnostic progress");
    progressWrap.append(progressText, progress);

    const form = createElement("form", "diagnostic-form");
    form.noValidate = true;
    const formAlert = createElement("p", "diagnostic-form-alert");
    formAlert.setAttribute("role", "alert");
    formAlert.hidden = true;

    function optionText(question, value) {
      const input = question.querySelector(`input[value="${value}"]`);
      if (!input) return value;
      const text = input.closest("label").querySelector(".diagnostic-option-text");
      return text ? text.textContent.trim() : value;
    }

    function buildOptions(question, questionNumber, answer) {
      const optionContainer = createElement("div", "diagnostic-options");
      const existingList = question.querySelector(":scope > ol[type='a'], :scope > ol");
      let choices = [];

      if (existingList) {
        choices = Array.from(existingList.children).map((item, index) => ({
          value: String.fromCharCode(97 + index),
          html: item.innerHTML
        }));
      } else if (answer === "true" || answer === "false") {
        choices = [
          { value: "true", text: labels.trueLabel },
          { value: "false", text: labels.falseLabel }
        ];
      }

      choices.forEach((choice) => {
        const option = createElement("label", "diagnostic-option");
        const input = document.createElement("input");
        const text = createElement("span", "diagnostic-option-text");
        input.type = "radio";
        input.name = `module-${moduleId}-q${questionNumber}`;
        input.value = choice.value;
        if (choice.html !== undefined) text.innerHTML = choice.html;
        else text.textContent = choice.text;
        option.append(input, text);
        optionContainer.append(option);
      });

      if (existingList) existingList.replaceWith(optionContainer);
      else {
        const firstParagraph = question.querySelector(":scope > p");
        if (firstParagraph) firstParagraph.insertAdjacentElement("afterend", optionContainer);
        else question.append(optionContainer);
      }
    }

    function buildFeedback(question, competency) {
      const callout = question.querySelector(":scope > .callout-tip, :scope > .callout");
      const feedback = createElement("div", "diagnostic-feedback");
      const status = createElement("p", "diagnostic-feedback-status");
      const explanation = createElement("div", "diagnostic-feedback-explanation");
      const action = createElement("p", "diagnostic-feedback-action");
      const actionLabel = createElement("span", "diagnostic-feedback-action-label", `${labels.nextAction}: `);
      const actionContent = createElement("span", "diagnostic-feedback-action-content");

      if (callout) {
        const body = callout.querySelector(".callout-body") || callout;
        explanation.innerHTML = body.innerHTML;
        callout.replaceWith(feedback);
      } else {
        question.append(feedback);
      }

      action.append(actionLabel, actionContent);
      feedback.append(status, explanation, action);
      feedback.hidden = true;
      feedback._status = status;
      feedback._actionContent = actionContent;
      feedback._competency = competency;
      return feedback;
    }

    questionSections.forEach((question, index) => {
      const questionNumber = index + 1;
      const answer = config.answers[index];
      const competency = competencies.find((item) => item.questions.includes(questionNumber));
      const heading = question.querySelector("h2");

      question.classList.add("diagnostic-question");
      question.dataset.question = String(questionNumber);
      question.dataset.answer = answer;
      question.dataset.competency = competency.id;
      question.setAttribute("role", "group");
      if (heading) {
        heading.id = `diagnostic-question-${moduleId}-${questionNumber}`;
        question.setAttribute("aria-labelledby", heading.id);
      }

      buildOptions(question, questionNumber, answer);
      question._feedback = buildFeedback(question, competency);
      form.append(question);
    });

    const actions = createElement("div", "diagnostic-form-actions");
    const submitButton = createElement("button", "diagnostic-button diagnostic-button-primary", labels.submit);
    submitButton.type = "submit";
    const retakeButton = createElement("button", "diagnostic-button", labels.retake);
    retakeButton.type = "button";
    const clearButton = createElement("button", "diagnostic-button diagnostic-button-quiet", labels.clear);
    clearButton.type = "button";
    actions.append(submitButton, retakeButton, clearButton);
    form.append(formAlert, actions);

    const result = createElement("section", "diagnostic-result");
    result.setAttribute("aria-live", "polite");
    result.hidden = true;

    shell.append(storageNotice, progressWrap, form, result);
    marker.replaceWith(shell);

    function saveState() {
      if (!storage) return;
      storage.setItem(storageKey, JSON.stringify(state));
    }

    function answeredCount() {
      return questionSections.filter((question) => question.querySelector("input:checked")).length;
    }

    function updateProgress() {
      const answered = answeredCount();
      progress.value = answered;
      progressText.textContent = labels.answered(answered, questionSections.length);
    }

    function clearGradeState() {
      questionSections.forEach((question) => {
        question.classList.remove("is-correct", "is-incorrect", "is-unanswered");
        question.querySelectorAll(".diagnostic-option").forEach((option) => {
          option.classList.remove("is-correct", "is-incorrect");
        });
        question._feedback.hidden = true;
      });
      result.hidden = true;
      graded = false;
      latestSummary = "";
    }

    function gradeQuestion(question) {
      const selected = question.querySelector("input:checked");
      const correctValue = question.dataset.answer;
      const isCorrect = selected.value === correctValue;
      const correctInput = question.querySelector(`input[value="${correctValue}"]`);
      const feedback = question._feedback;

      question.classList.add(isCorrect ? "is-correct" : "is-incorrect");
      correctInput.closest(".diagnostic-option").classList.add("is-correct");
      if (!isCorrect) selected.closest(".diagnostic-option").classList.add("is-incorrect");

      feedback._status.textContent = isCorrect
        ? `${labels.correct}. ${labels.expected}: ${optionText(question, correctValue)}.`
        : `${labels.incorrect}. ${labels.selected}: ${optionText(question, selected.value)}. ${labels.expected}: ${optionText(question, correctValue)}.`;

      feedback._actionContent.replaceChildren();
      if (isCorrect) {
        feedback._actionContent.textContent = labels.correctAction;
      } else {
        const resource = feedback._competency.resources[0];
        const link = createElement("a", "", resource.label);
        link.href = resource.href;
        feedback._actionContent.append(document.createTextNode(`${feedback._competency.action} `), link);
      }
      feedback.hidden = false;
      return isCorrect;
    }

    function stateLabel(stateName) {
      return labels[stateName];
    }

    function renderResult(score, competencyScores) {
      const overallRatio = score / questionSections.length;
      const hasPriorityCompetency = competencyScores.some((item) => item.ratio < CONSOLIDATE_THRESHOLD);
      let overallState = "priority";
      if (overallRatio >= READY_THRESHOLD && !hasPriorityCompetency) overallState = "ready";
      else if (overallRatio >= CONSOLIDATE_THRESHOLD) overallState = "consolidate";

      const attemptNumber = state.attempts.length + 1;
      const resultHeader = createElement("div", "diagnostic-result-header");
      const scoreBox = createElement("div", "diagnostic-score-box", `${score} / ${questionSections.length}`);
      scoreBox.setAttribute("aria-label", labels.globalResult);
      const resultIntro = createElement("div", "diagnostic-result-intro");
      const attempt = createElement("p", "diagnostic-eyebrow", labels.attempt(attemptNumber));
      const title = createElement("h2", "", stateLabel(overallState));
      const message = createElement("p", "", labels[`${overallState}Message`]);
      resultIntro.append(attempt, title, message);
      resultHeader.append(scoreBox, resultIntro);

      const tableHeading = createElement("h3", "", labels.competenceResults);
      const tableWrap = createElement("div", "diagnostic-table-wrap");
      const table = createElement("table", "diagnostic-table");
      const thead = document.createElement("thead");
      const headerRow = document.createElement("tr");
      [labels.competence, labels.result, labels.interpretation, labels.resources].forEach((text) => {
        headerRow.append(createElement("th", "", text));
      });
      thead.append(headerRow);
      const tbody = document.createElement("tbody");

      competencyScores.forEach((item) => {
        const row = document.createElement("tr");
        const nameCell = createElement("th", "", item.competency.label);
        nameCell.scope = "row";
        const scoreCell = createElement("td", "", `${item.score} / ${item.total} (${percentage(item.ratio)} %)`);
        const stateCell = document.createElement("td");
        const badge = createElement("span", `diagnostic-state diagnostic-state-${item.state}`, stateLabel(item.state));
        stateCell.append(badge);
        const resourcesCell = document.createElement("td");
        const resourceList = createElement("ul", "diagnostic-resource-list");
        item.competency.resources.forEach((resource) => {
          const listItem = document.createElement("li");
          const link = createElement("a", "", resource.label);
          link.href = resource.href;
          listItem.append(link);
          resourceList.append(listItem);
        });
        resourcesCell.append(resourceList);
        row.append(nameCell, scoreCell, stateCell, resourcesCell);
        tbody.append(row);
      });
      table.append(thead, tbody);
      tableWrap.append(table);

      const plan = createElement("section", "diagnostic-review-plan");
      plan.append(createElement("h3", "", labels.recommendedActions));
      const weakCompetencies = competencyScores
        .filter((item) => item.state !== "ready")
        .sort((a, b) => a.ratio - b.ratio);

      if (weakCompetencies.length === 0) {
        plan.append(createElement("p", "", labels.noWeakness));
      } else {
        const planList = document.createElement("ol");
        weakCompetencies.forEach((item) => {
          const listItem = document.createElement("li");
          const action = createElement("p", "", item.competency.action);
          const resourceList = createElement("ul", "diagnostic-resource-list");
          item.competency.resources.forEach((resource) => {
            const resourceItem = document.createElement("li");
            const link = createElement("a", "", resource.label);
            link.href = resource.href;
            resourceItem.append(link);
            resourceList.append(resourceItem);
          });
          listItem.append(createElement("h4", "", `${item.competency.label}: ${stateLabel(item.state)}`), action, resourceList);
          planList.append(listItem);
        });
        plan.append(planList);
      }

      const thresholdNote = createElement("p", "diagnostic-threshold-note", labels.thresholdNote);
      const resultActions = createElement("div", "diagnostic-result-actions");
      const copyButton = createElement("button", "diagnostic-button", labels.copy);
      copyButton.type = "button";
      resultActions.append(copyButton);

      latestSummary = [
        labels.summaryTitle(moduleId),
        `${labels.attempt(attemptNumber)}: ${score} / ${questionSections.length}`,
        `${labels.interpretation}: ${stateLabel(overallState)}`,
        ...competencyScores.map((item) => `${item.competency.label}: ${item.score} / ${item.total} - ${stateLabel(item.state)}`)
      ].join("\n");

      copyButton.addEventListener("click", () => {
        const setStatus = (text) => {
          copyButton.textContent = text;
          window.setTimeout(() => { copyButton.textContent = labels.copy; }, 2200);
        };
        if (navigator.clipboard && window.isSecureContext) {
          navigator.clipboard.writeText(latestSummary).then(
            () => setStatus(labels.copied),
            () => setStatus(labels.copyFailed)
          );
        } else {
          const textarea = document.createElement("textarea");
          textarea.value = latestSummary;
          textarea.setAttribute("readonly", "");
          textarea.style.position = "fixed";
          textarea.style.opacity = "0";
          document.body.append(textarea);
          textarea.select();
          const copied = document.execCommand("copy");
          textarea.remove();
          setStatus(copied ? labels.copied : labels.copyFailed);
        }
      });

      result.className = `diagnostic-result diagnostic-result-${overallState}`;
      result.replaceChildren(resultHeader, tableHeading, tableWrap, plan, thresholdNote, resultActions);
      result.hidden = false;
      result.setAttribute("tabindex", "-1");

      state.attempts.push({
        completedAt: new Date().toISOString(),
        score,
        total: questionSections.length,
        state: overallState,
        competencies: competencyScores.map((item) => ({
          id: item.competency.id,
          score: item.score,
          total: item.total,
          state: item.state
        }))
      });
      saveState();
      graded = true;
      result.focus();
      result.scrollIntoView({ behavior: "smooth", block: "start" });
    }

    form.addEventListener("change", (event) => {
      const question = event.target.closest(".diagnostic-question");
      if (!question) return;
      const questionNumber = question.dataset.question;
      state.answers[questionNumber] = event.target.value;
      saveState();
      question.classList.remove("is-unanswered");
      formAlert.hidden = true;
      if (graded) clearGradeState();
      updateProgress();
    });

    form.addEventListener("submit", (event) => {
      event.preventDefault();
      clearGradeState();
      const unanswered = questionSections.filter((question) => !question.querySelector("input:checked"));

      if (unanswered.length > 0) {
        formAlert.textContent = labels.unanswered(unanswered.length);
        formAlert.hidden = false;
        unanswered.forEach((question) => question.classList.add("is-unanswered"));
        unanswered[0].querySelector("input").focus();
        unanswered[0].scrollIntoView({ behavior: "smooth", block: "center" });
        return;
      }

      const competencyScores = competencies.map((competency) => ({
        competency,
        score: 0,
        total: competency.questions.length,
        ratio: 0,
        state: "priority"
      }));
      let score = 0;

      questionSections.forEach((question) => {
        const correct = gradeQuestion(question);
        const competencyScore = competencyScores.find((item) => item.competency.id === question.dataset.competency);
        if (correct) {
          score += 1;
          competencyScore.score += 1;
        }
      });

      competencyScores.forEach((item) => {
        item.ratio = item.score / item.total;
        item.state = stateForRatio(item.ratio);
      });
      renderResult(score, competencyScores);
    });

    retakeButton.addEventListener("click", () => {
      form.reset();
      state.answers = {};
      saveState();
      clearGradeState();
      formAlert.hidden = true;
      updateProgress();
      shell.scrollIntoView({ behavior: "smooth", block: "start" });
      questionSections[0].querySelector("input").focus({ preventScroll: true });
    });

    clearButton.addEventListener("click", () => {
      form.reset();
      state = { answers: {}, attempts: [] };
      if (storage) storage.removeItem(storageKey);
      clearGradeState();
      formAlert.hidden = true;
      storageNotice.textContent = labels.cleared;
      updateProgress();
    });

    let restoredAnswers = 0;
    Object.entries(state.answers).forEach(([questionNumber, value]) => {
      const input = form.querySelector(`input[name="module-${moduleId}-q${questionNumber}"][value="${value}"]`);
      if (input) {
        input.checked = true;
        restoredAnswers += 1;
      }
    });
    if (restoredAnswers > 0 && storage) storageNotice.textContent = `${labels.storageActive} ${labels.restored}`;
    updateProgress();
  }

  function initialiseAllDiagnostics() {
    document.querySelectorAll("[data-stt-mini-test-diagnostic]").forEach(initialiseDiagnostic);
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initialiseAllDiagnostics);
  } else {
    initialiseAllDiagnostics();
  }
})();
