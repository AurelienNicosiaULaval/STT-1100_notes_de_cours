# Défi 4 - Nettoyer et documenter une base d’assurance

STT-1100 Introduction à la science des données

# Mission

Vous travaillez avec Alex sur une base d’assurance issue d’un ancien système. Votre mission est de produire une version nettoyée du fichier `dataset_pratique.csv` et de documenter clairement les décisions prises.

Le but n’est pas de corriger tout ce qui pourrait être discutable. Le but est de montrer que vous savez importer le fichier correctement, repérer des anomalies, choisir des corrections défendables et conserver une trace structurée de votre travail.

# Données de départ

Le fichier principal est `dataset_pratique.csv`. Il est séparé par des points-virgules.

``` r
library(readr)
library(dplyr)
library(janitor)
library(ggplot2)
library(stringr)
library(forcats)

base <- read_delim(
  "dataset_pratique.csv",
  delim = ";",
  trim_ws = TRUE,
  show_col_types = FALSE
) |>
  clean_names()
```

Après l’importation, vérifiez que vous obtenez 23 colonnes. Si vous obtenez une seule colonne, l’importation n’est pas correcte.

# Livrables

Votre dépôt GitHub doit contenir les trois fichiers suivants :

- `defi_04.qmd` : votre document de travail reproductible;
- `donnees_propres.csv` : la base nettoyée;
- `journal_nettoyage.Rdata` : un objet R contenant la liste `journal_nettoyage`.

Votre fichier `.qmd` doit pouvoir être rendu en HTML sans erreur.

# Structure minimale du journal

Votre objet `journal_nettoyage` doit être une liste nommée. Chaque entrée doit contenir au moins les champs `id`, `variables`, `probleme`, `action` et `justification`.

``` r
journal_nettoyage <- list(
  VM = list(),
  DF = list(),
  IF = list(),
  VA = list(),
  FT = list(),
  RC = list(),
  TY = list(),
  LG = list(),
  CI = list(),
  RU = list(),
  TR = list(),
  EC = list()
)
```

Exemple d’entrée :

``` r
journal_nettoyage$RC <- append(journal_nettoyage$RC, list(
  list(
    id = 40064548,
    variables = "vehicle_type",
    probleme = "Niveau aberrant dans une variable de type de véhicule",
    action = "Remplacement de 'ANIMAL' par NA",
    justification = "La valeur ne décrit pas un type de véhicule exploitable"
  )
))
```

# Exigences minimales

Votre travail doit inclure :

1.  une importation correcte du fichier;
2.  un aperçu de la structure des données;
3.  au moins cinq vérifications de qualité;
4.  au moins trois corrections appliquées à la base;
5.  au moins cinq entrées documentées dans `journal_nettoyage`;
6.  une sauvegarde de la base propre;
7.  une sauvegarde de `journal_nettoyage`.

Les corrections doivent être prudentes. Si une anomalie est réelle mais qu’aucune correction évidente n’est défendable, notez-la dans votre journal ou dans votre texte et expliquez pourquoi vous ne la corrigez pas.

# Pistes de vérification

Voici des pistes utiles. Vous n’êtes pas obligé de toutes les corriger.

- `vehicle_type` contient une valeur aberrante.
- `vehicle_year` contient une année impossible.
- `fsa_code` devrait contenir trois caractères.
- `quarter` et `season` peuvent être comparés.
- `years_licensed` ne devrait pas dépasser `age`.
- `commute_distance` contient des valeurs manquantes et des valeurs élevées.
- Certaines variables catégorielles gagnent à être converties en facteurs.

# Sauvegarde des résultats

À la fin de votre document, sauvegardez vos deux objets de remise.

``` r
write_csv(donnees_propres, "donnees_propres.csv")
save(journal_nettoyage, file = "journal_nettoyage.Rdata")
```

# Grille d’évaluation

| Critère | Excellent | Satisfaisant | À améliorer |
|----|----|----|----|
| Importation | Le fichier est importé correctement et la structure est vérifiée | Le fichier est importé, mais les contrôles sont limités | Le fichier est mal importé ou la structure n’est pas vérifiée |
| Diagnostic | Plusieurs anomalies réelles sont identifiées avec des sorties utiles | Quelques anomalies sont identifiées | Les diagnostics sont vagues ou non reproductibles |
| Corrections | Les corrections sont prudentes, justifiées et reproductibles | Les corrections sont présentes mais peu justifiées | Les corrections sont absentes ou arbitraires |
| Journal | Le journal est structuré, complet et cohérent avec le code | Le journal existe mais certaines entrées sont incomplètes | Le journal est absent ou difficile à utiliser |
| Reproductibilité | Le `.qmd` se rend sans erreur et produit les fichiers attendus | Le `.qmd` demande de petites corrections | Le travail ne peut pas être reproduit |

# Checklist avant remise

- Le fichier `.qmd` se rend en HTML.
- `donnees_propres.csv` est créé par le code.
- `journal_nettoyage.Rdata` est créé par le code.
- Les noms de variables utilisés dans le code sont ceux obtenus après `clean_names()`.
- Le dépôt GitHub contient les fichiers attendus.
