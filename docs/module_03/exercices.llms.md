# Exercices de consolidation

> **IMPORTANT:**
>
> [Télécharger le dossier prêt à ouvrir (.zip)](../downloads/donnees/stt1100-module-03-fr.zip)
>
> Décompressez le fichier, puis ouvrez le projet `.Rproj`. Les chemins utilisés dans les exercices fonctionneront sans déplacer les données.

Ces exercices servent à stabiliser les gestes du module: reconnaître une variable catégorique, compter des modalités, nettoyer des chaînes de caractères, extraire des motifs et construire des graphiques lisibles.

Ils sont indépendants de l’aventure et du défi. Ils pratiquent les mêmes compétences, mais sans préparer directement l’article sur les infractions alimentaires.

``` r
library(tidyverse)
```

## Bloc A - Variables catégoriques et fréquences

### Exercice 1 - Reconnaître le type des variables

Voici un petit jeu de données.

``` r
sondage <- tibble(
  programme = c("Statistique", "Économie", "Statistique", "Biologie", "Économie"),
  age = c(21, 24, 22, 20, 27),
  campus = c("Québec", "Québec", "Montréal", "Québec", "Montréal"),
  satisfaction = c("Élevée", "Moyenne", "Élevée", "Faible", "Moyenne")
)
```

Indiquez quelles variables sont catégoriques et quelles variables sont numériques.

> **NOTE:**
>
> `programme`, `campus` et `satisfaction` sont catégoriques. `age` est numérique.

### Exercice 2 - Créer une table de fréquences

Calculez le nombre d’étudiants par programme.

> **TIP:**
>
> Utilisez `count()`.

> **NOTE:**
>
> ``` r
> sondage |>
>   count(programme, sort = TRUE)
> ```
>
>     # A tibble: 3 × 2
>       programme       n
>       <chr>       <int>
>     1 Statistique     2
>     2 Économie        2
>     3 Biologie        1

### Exercice 3 - Ajouter des proportions

À partir du résultat précédent, ajoutez une proportion et un pourcentage.

> **NOTE:**
>
> ``` r
> sondage |>
>   count(programme, sort = TRUE) |>
>   mutate(
>     proportion = n / sum(n),
>     pourcentage = 100 * proportion
>   )
> ```
>
>     # A tibble: 3 × 4
>       programme       n proportion pourcentage
>       <chr>       <int>      <dbl>       <dbl>
>     1 Statistique     2        0.4          40
>     2 Économie        2        0.4          40
>     3 Biologie        1        0.2          20

### Exercice 4 - Construire un tableau croisé

Construisez un tableau croisé entre `programme` et `campus`.

> **NOTE:**
>
> ``` r
> sondage |>
>   count(programme, campus) |>
>   pivot_wider(
>     names_from = campus,
>     values_from = n,
>     values_fill = 0
>   )
> ```
>
>     # A tibble: 3 × 3
>       programme   Québec Montréal
>       <chr>        <int>    <int>
>     1 Biologie         1        0
>     2 Statistique      1        1
>     3 Économie         1        1

## Bloc B - Chaînes de caractères et motifs

### Exercice 5 - Harmoniser des réponses

Voici une variable de réponses saisies avec des formats différents.

``` r
reponses <- tibble(
  reponse = c(" Oui", "oui", "OUI ", "Non", " non", "NON", "Je ne sais pas")
)
```

Créez une variable `reponse_propre` en minuscules, sans espaces superflus.

> **NOTE:**
>
> ``` r
> reponses |>
>   mutate(reponse_propre = str_squish(str_to_lower(reponse)))
> ```
>
>     # A tibble: 7 × 2
>       reponse          reponse_propre
>       <chr>            <chr>
>     1 " Oui"           oui
>     2 "oui"            oui
>     3 "OUI "           oui
>     4 "Non"            non
>     5 " non"           non
>     6 "NON"            non
>     7 "Je ne sais pas" je ne sais pas

### Exercice 6 - Détecter un mot-clé

Dans le vecteur suivant, détectez les textes qui contiennent le mot `"retard"`, peu importe la casse.

``` r
commentaires <- tibble(
  texte = c(
    "Retard du service",
    "Service rapide",
    "retard important",
    "Aucun problème",
    "RETARD répété"
  )
)
```

> **NOTE:**
>
> ``` r
> commentaires |>
>   mutate(contient_retard = str_detect(str_to_lower(texte), "retard"))
> ```
>
>     # A tibble: 5 × 2
>       texte             contient_retard
>       <chr>             <lgl>
>     1 Retard du service TRUE
>     2 Service rapide    FALSE
>     3 retard important  TRUE
>     4 Aucun problème    FALSE
>     5 RETARD répété     TRUE

### Exercice 7 - Extraire des codes postaux

À partir des adresses suivantes, extrayez un code postal canadien simplifié.

``` r
adresses <- tibble(
  adresse = c(
    "2500 boul. Laurier, Québec G1V 2L1",
    "475 rue Sherbrooke Ouest, Montréal H3A 2L9",
    "100 rue Wellington, Gatineau J8X 2J1",
    "Adresse inconnue"
  )
)
```

> **NOTE:**
>
> ``` r
> adresses |>
>   mutate(
>     code_postal = str_extract(
>       adresse,
>       "[A-Z][0-9][A-Z]\\s*[0-9][A-Z][0-9]"
>     )
>   )
> ```
>
>     # A tibble: 4 × 2
>       adresse                                    code_postal
>       <chr>                                      <chr>
>     1 2500 boul. Laurier, Québec G1V 2L1         G1V 2L1
>     2 475 rue Sherbrooke Ouest, Montréal H3A 2L9 H3A 2L9
>     3 100 rue Wellington, Gatineau J8X 2J1       J8X 2J1
>     4 Adresse inconnue                           <NA>

### Exercice 8 - Transformer un montant textuel

Convertissez les montants suivants en valeurs numériques.

``` r
amendes <- tibble(
  montant = c("1 000 $", "500$", "2 250 $", "750 dollars")
)
```

> **NOTE:**
>
> ``` r
> amendes |>
>   mutate(amende_num = parse_number(
>     montant,
>     locale = locale(grouping_mark = " ")
>   ))
> ```
>
>     # A tibble: 4 × 2
>       montant     amende_num
>       <chr>            <dbl>
>     1 1 000 $           1000
>     2 500$               500
>     3 2 250 $           2250
>     4 750 dollars        750

## Bloc C - Pratiquer sur des demandes de services fictives

Les exercices 9 à 12 utilisent un petit jeu fictif de demandes de services sur un campus. Le contexte est distinct de l’aventure et du défi.

### Exercice 9 - Construire une base propre

Voici les données brutes.

``` r
services_campus_brut <- tibble(
  id = paste0("REQ-", str_pad(1:12, 2, pad = "0")),
  campus = c("Québec", "Quebec", "Montréal", "Montreal", "Lévis", "Levis",
             "Québec", "Montréal", "Lévis", "Québec", "Montreal", "Levis"),
  service = c("Bibliotheque", "Bibliothèque", "Wi-Fi", "wifi", "Stationnement",
              "stationnement", "Navette", "navette", "Impression", "impression",
              "Bibliotheque", "Wi-Fi"),
  description = c(
    "Retard de navette signalé",
    "Salle de lecture bruyante",
    "wifi instable au pavillon",
    "Connexion WiFi absente",
    "Paiement impossible",
    "stationnement complet",
    "Retard de la navette du soir",
    "Navette saturée",
    "Imprimante sans papier",
    "Impression bloquée",
    "livres mal rangés",
    "Connexion lente"
  ),
  statut = c("ouvert", "Ouvert ", "ferme", "Fermé", "ouvert", "en cours",
             "En cours", "ferme", "ouvert", "Fermé", "en cours", "ouvert"),
  cout = c("0 $", "150 $", "0$", "300 $", "1 200 $", "0 $",
           "850 $", "0 $", "75 $", "90 $", "0 $", "200 $")
)

services_campus_brut
```

    # A tibble: 12 × 6
       id     campus   service       description                  statut     cout
       <chr>  <chr>    <chr>         <chr>                        <chr>      <chr>
     1 REQ-01 Québec   Bibliotheque  Retard de navette signalé    "ouvert"   0 $
     2 REQ-02 Quebec   Bibliothèque  Salle de lecture bruyante    "Ouvert "  150 $
     3 REQ-03 Montréal Wi-Fi         wifi instable au pavillon    "ferme"    0$
     4 REQ-04 Montreal wifi          Connexion WiFi absente       "Fermé"    300 $
     5 REQ-05 Lévis    Stationnement Paiement impossible          "ouvert"   1 200 $
     6 REQ-06 Levis    stationnement stationnement complet        "en cours" 0 $
     7 REQ-07 Québec   Navette       Retard de la navette du soir "En cours" 850 $
     8 REQ-08 Montréal navette       Navette saturée              "ferme"    0 $
     9 REQ-09 Lévis    Impression    Imprimante sans papier       "ouvert"   75 $
    10 REQ-10 Québec   impression    Impression bloquée           "Fermé"    90 $
    11 REQ-11 Montreal Bibliotheque  livres mal rangés            "en cours" 0 $
    12 REQ-12 Levis    Wi-Fi         Connexion lente              "ouvert"   200 $

Créez une table `services_campus` contenant:

- un campus harmonisé;
- un service harmonisé;
- un statut harmonisé;
- un coût numérique `cout_num`.

> **NOTE:**
>
> ``` r
> services_campus <- services_campus_brut |>
>   mutate(
>     campus = str_squish(campus),
>     campus = recode(
>       campus,
>       "Quebec" = "Québec",
>       "Montreal" = "Montréal",
>       "Levis" = "Lévis"
>     ),
>     service = str_to_lower(str_squish(service)),
>     service = case_when(
>       str_detect(service, "biblio") ~ "bibliothèque",
>       str_detect(service, "wi-fi|wifi") ~ "wi-fi",
>       str_detect(service, "stationnement") ~ "stationnement",
>       str_detect(service, "navette") ~ "navette",
>       str_detect(service, "impression") ~ "impression",
>       TRUE ~ service
>     ),
>     statut = str_to_lower(str_squish(statut)),
>     statut = recode(statut, "fermé" = "ferme"),
>     cout_num = parse_number(cout, locale = locale(grouping_mark = " "))
>   )
>
> services_campus |>
>   select(id, campus, service, statut, cout_num)
> ```
>
>     # A tibble: 12 × 5
>        id     campus   service       statut   cout_num
>        <chr>  <chr>    <chr>         <chr>       <dbl>
>      1 REQ-01 Québec   bibliothèque  ouvert          0
>      2 REQ-02 Québec   bibliothèque  ouvert        150
>      3 REQ-03 Montréal wi-fi         ferme           0
>      4 REQ-04 Montréal wi-fi         ferme         300
>      5 REQ-05 Lévis    stationnement ouvert       1200
>      6 REQ-06 Lévis    stationnement en cours        0
>      7 REQ-07 Québec   navette       en cours      850
>      8 REQ-08 Montréal navette       ferme           0
>      9 REQ-09 Lévis    impression    ouvert         75
>     10 REQ-10 Québec   impression    ferme          90
>     11 REQ-11 Montréal bibliothèque  en cours        0
>     12 REQ-12 Lévis    wi-fi         ouvert        200

### Exercice 10 - Compter les services demandés

Calculez le nombre de demandes par campus et par service.

> **NOTE:**
>
> ``` r
> services_campus |>
>   count(campus, service, sort = TRUE)
> ```
>
>     # A tibble: 9 × 3
>       campus   service           n
>       <chr>    <chr>         <int>
>     1 Lévis    stationnement     2
>     2 Montréal wi-fi             2
>     3 Québec   bibliothèque      2
>     4 Lévis    impression        1
>     5 Lévis    wi-fi             1
>     6 Montréal bibliothèque      1
>     7 Montréal navette           1
>     8 Québec   impression        1
>     9 Québec   navette           1

### Exercice 11 - Comparer les statuts par campus

Calculez la proportion de demandes dans chaque statut pour chaque campus.

> **NOTE:**
>
> ``` r
> services_campus |>
>   count(campus, statut) |>
>   group_by(campus) |>
>   mutate(proportion = n / sum(n)) |>
>   ungroup() |>
>   arrange(campus, desc(proportion))
> ```
>
>     # A tibble: 7 × 4
>       campus   statut       n proportion
>       <chr>    <chr>    <int>      <dbl>
>     1 Lévis    ouvert       3       0.75
>     2 Lévis    en cours     1       0.25
>     3 Montréal ferme        3       0.75
>     4 Montréal en cours     1       0.25
>     5 Québec   ouvert       2       0.5
>     6 Québec   en cours     1       0.25
>     7 Québec   ferme        1       0.25

### Exercice 12 - Détecter des mots-clés

Créez deux variables logiques:

- `contient_retard`, qui vaut `TRUE` si la description contient `"retard"`;
- `contient_connexion`, qui vaut `TRUE` si la description contient `"wifi"` ou `"connexion"`.

> **NOTE:**
>
> ``` r
> services_campus <- services_campus |>
>   mutate(
>     description_min = str_to_lower(description),
>     contient_retard = str_detect(description_min, "retard"),
>     contient_connexion = str_detect(description_min, "wifi|connexion")
>   )
>
> services_campus |>
>   select(id, service, contient_retard, contient_connexion)
> ```
>
>     # A tibble: 12 × 4
>        id     service       contient_retard contient_connexion
>        <chr>  <chr>         <lgl>           <lgl>
>      1 REQ-01 bibliothèque  TRUE            FALSE
>      2 REQ-02 bibliothèque  FALSE           FALSE
>      3 REQ-03 wi-fi         FALSE           TRUE
>      4 REQ-04 wi-fi         FALSE           TRUE
>      5 REQ-05 stationnement FALSE           FALSE
>      6 REQ-06 stationnement FALSE           FALSE
>      7 REQ-07 navette       TRUE            FALSE
>      8 REQ-08 navette       FALSE           FALSE
>      9 REQ-09 impression    FALSE           FALSE
>     10 REQ-10 impression    FALSE           FALSE
>     11 REQ-11 bibliothèque  FALSE           FALSE
>     12 REQ-12 wi-fi         FALSE           TRUE

## Bloc D - Visualiser des catégories

### Exercice 13 - Ordonner un diagramme à bandes

Produisez un diagramme à bandes du nombre de demandes par service. Ordonnez les services de la plus fréquente à la moins fréquente.

> **NOTE:**
>
> ``` r
> services_campus |>
>   count(service, sort = TRUE) |>
>   ggplot(aes(x = fct_reorder(service, n), y = n)) +
>   geom_col(fill = "#2F6C8F") +
>   coord_flip() +
>   labs(
>     x = "Service",
>     y = "Nombre de demandes",
>     title = "Demandes de services fictives par catégorie"
>   ) +
>   theme_minimal()
> ```
>
> ![Boîtes à moustaches horizontales comparant la distribution des coûts déclarés selon le service.](exercices_files/figure-html/unnamed-chunk-18-1.png)

### Exercice 14 - Comparer des proportions avec `position = "fill"`

Comparez la composition des statuts entre les campus.

> **NOTE:**
>
> ``` r
> services_campus |>
>   count(campus, statut) |>
>   group_by(campus) |>
>   mutate(proportion = n / sum(n)) |>
>   ungroup() |>
>   ggplot(aes(x = campus, y = proportion, fill = statut)) +
>   geom_col(position = "fill") +
>   scale_y_continuous(labels = scales::percent) +
>   labs(
>     x = "Campus",
>     y = "Proportion",
>     fill = "Statut",
>     title = "Composition des statuts selon le campus"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-19-1.png)

### Exercice 15 - Comparer les coûts par service

Créez un graphique comparant les coûts déclarés selon le service.

> **NOTE:**
>
> ``` r
> services_campus |>
>   filter(cout_num > 0) |>
>   ggplot(aes(x = service, y = cout_num)) +
>   geom_boxplot(fill = "#D8A24A") +
>   coord_flip() +
>   scale_y_continuous(labels = scales::dollar) +
>   labs(
>     x = "Service",
>     y = "Coût déclaré",
>     title = "Coûts associés aux demandes de services fictives"
>   ) +
>   theme_minimal()
> ```
>
> ![](exercices_files/figure-html/unnamed-chunk-20-1.png)

### Exercice 16 - Améliorer le message d’un graphique

Reprenez un graphique précédent et améliorez-le pour un lecteur non spécialiste:

- titre informatif;
- axes lisibles;
- catégories ordonnées;
- unités ou pourcentages clairement indiqués;
- court commentaire de deux phrases sous le graphique.

> **NOTE:**
>
> ``` r
> graphique_services <- services_campus |>
>   count(service, sort = TRUE) |>
>   mutate(part = n / sum(n)) |>
>   ggplot(aes(x = fct_reorder(service, part), y = part)) +
>   geom_col(fill = "#2F6C8F") +
>   coord_flip() +
>   scale_y_continuous(labels = scales::percent) +
>   labs(
>     x = NULL,
>     y = "Part des demandes",
>     title = "Les demandes se répartissent entre quelques services récurrents"
>   ) +
>   theme_minimal()
>
> graphique_services
> ```
>
> ![Diagramme à bandes horizontal montrant la part des demandes attribuée à chaque service.](exercices_files/figure-html/unnamed-chunk-21-1.png)
>
> Commentaire possible: le graphique montre les services qui reviennent le plus souvent dans cet échantillon fictif. Il faut toutefois rappeler que le fichier sert à pratiquer les méthodes et ne mesure pas un vrai volume de demandes.

## Études de cas

### Étude de cas 1 - Requêtes 311 de Montréal

Le fichier `data/requetes_311_montreal.csv` est un extrait réel de demandes 311 de Montréal. Une demande ne représente pas nécessairement une intervention municipale.

Réalisez les tâches suivantes:

1.  importez le fichier;
2.  nettoyez la variable `categorie`;
3.  calculez le nombre de demandes par arrondissement et par catégorie;
4.  calculez la proportion des statuts selon la nature de la demande;
5.  produisez un graphique des catégories les plus fréquentes;
6.  rédigez deux phrases qui pourraient apparaître dans un court rapport.

> **NOTE:**
>
> ``` r
> requetes_311 <- read_csv(
>   "data/requetes_311_montreal.csv",
>   show_col_types = FALSE
> ) |>
>   mutate(
>     categorie = str_squish(categorie)
>   )
>
> requetes_311 |>
>   count(arrondissement, categorie, sort = TRUE)
> ```
>
>     # A tibble: 122 × 3
>        arrondissement categorie                                    n
>        <chr>          <chr>                                    <int>
>      1 Non assigné    Info-Remorquage                             75
>      2 Non assigné    Collecte des encombrants                    50
>      3 Non assigné    Taxes foncières                             46
>      4 Non assigné    Collecte de déchets                         45
>      5 Non assigné    Y-Eau - Divers                              30
>      6 Non assigné    Organisme divers                            27
>      7 Non assigné    Fermeture d'une conduite d'eau - Urgence    23
>      8 Non assigné    Fermeture d'entrée d'eau                    21
>      9 Non assigné    Manque d'eau                                20
>     10 Non assigné    Intervention stationnement                  19
>     # ℹ 112 more rows
>
> ``` r
> requetes_311 |>
>   count(nature, statut) |>
>   group_by(nature) |>
>   mutate(proportion = n / sum(n)) |>
>   ungroup()
> ```
>
>     # A tibble: 1 × 4
>       nature      statut          n proportion
>       <chr>       <chr>       <int>      <dbl>
>     1 Information Sans statut   750          1
>
> ``` r
> requetes_311 |>
>   count(categorie, sort = TRUE) |>
>   slice_head(n = 12) |>
>   ggplot(aes(x = fct_reorder(categorie, n), y = n)) +
>   geom_col(fill = "#4B8B3B") +
>   coord_flip() +
>   labs(
>     x = "Catégorie",
>     y = "Nombre de demandes",
>     title = "Catégories fréquentes dans l'extrait 311"
>   ) +
>   theme_minimal()
> ```
>
> ![Diagramme à bandes horizontal des douze catégories les plus fréquentes dans l'extrait des requêtes 311 de Montréal.](exercices_files/figure-html/unnamed-chunk-22-1.png)
>
> Commentaire possible: l’extrait décrit les demandes publiées, sans permettre de conclure au volume réel de travail ou à la qualité des interventions.

### Étude de cas 2 - Plaintes de consommation au Québec

Le fichier `data/plaintes_consommation_quebec.csv` est un extrait réel de plaintes reçues par l’Office de la protection du consommateur. Une plainte est une affirmation non vérifiée.

Réalisez les tâches suivantes:

1.  importez le fichier;
2.  calculez le total de plaintes par ville de siège social;
3.  identifiez les motifs les plus fréquents;
4.  comparez les catégories de produits entre les villes avec un graphique en proportions;
5.  proposez une recommandation opérationnelle appuyée par un chiffre.

> **NOTE:**
>
> ``` r
> plaintes_transport <- read_csv(
>   "data/plaintes_consommation_quebec.csv",
>   show_col_types = FALSE
> )
>
> plaintes_transport |>
>   count(ville_siege_social, sort = TRUE)
> ```
>
>     # A tibble: 158 × 2
>        ville_siege_social     n
>        <chr>              <int>
>      1 Montréal             110
>      2 <NA>                  76
>      3 Québec                44
>      4 Laval                 40
>      5 Toronto               24
>      6 Boucherville          23
>      7 Saint-Eustache        19
>      8 Vancouver             19
>      9 Longueuil             16
>     10 Gatineau              15
>     # ℹ 148 more rows
>
> ``` r
> plaintes_transport |>
>   count(motif, sort = TRUE)
> ```
>
>     # A tibble: 7 × 2
>       motif                                                              n
>       <chr>                                                          <int>
>     1 Qualité des biens et services                                    238
>     2 Service à la clientèle / Absence de livraison / Non conformité   187
>     3 Pratique trompeuse ou déloyale                                   180
>     4 Mésentente liée au contrat conclu                                 66
>     5 Problème de facturation ou de recouvrement de créance             51
>     6 Mésentente avant l’achat liée au prix / au tarif                  22
>     7 Autre                                                              6
>
> ``` r
> plaintes_transport |>
>   count(ville_siege_social, categorie_produit, name = "total") |>
>   group_by(ville_siege_social) |>
>   mutate(proportion = total / sum(total)) |>
>   ungroup() |>
>   ggplot(aes(x = ville_siege_social, y = proportion, fill = categorie_produit)) +
>   geom_col(position = "fill") +
>   scale_y_continuous(labels = scales::percent) +
>   labs(
>     x = "Ville du siège social",
>     y = "Proportion des plaintes",
>     fill = "Catégorie",
>     title = "Composition des plaintes de consommation"
>   ) +
>   theme_minimal()
> ```
>
> ![Diagramme à bandes empilées à 100 % comparant les catégories de plaintes de consommation selon la ville du siège social.](exercices_files/figure-html/unnamed-chunk-23-1.png)
>
> Recommandation possible: il faut cibler les catégories de plaintes qui combinent un volume élevé et une gravité élevée. Dans un rapport, on citerait le total par réseau et la part de plaintes de gravité élevée avant de proposer une action.
