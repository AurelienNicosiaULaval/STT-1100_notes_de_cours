# Provenance des données réelles du module 1

Les deux fichiers de ce dossier sont des extraits reproductibles de données ouvertes. Ils sont créés par `scripts/build_module01_real_data.R`.

## `bibliotheques_publiques_quebec_2024.csv`

- Source : Bibliothèque et Archives nationales du Québec, [Statistiques des bibliothèques publiques du Québec](https://www.donneesquebec.ca/recherche/dataset/statistiques_des_bibliotheques_publiques_du_quebec).
- Ressource utilisée : statistiques annuelles 2024, téléchargée le 10 juillet 2026.
- Unité d'observation : une bibliothèque publique ou un centre régional.
- Transformation : sélection de six colonnes directement utiles aux exercices, sans modifier les observations.
- Licence : [CC-BY 4.0](https://www.donneesquebec.ca/licence/#cc-by).
- Limite importante : une cellule vide signifie que la statistique est indisponible ou non applicable; ce n'est pas une valeur de zéro.

## `frequentation_portail_montreal_2023.csv`

- Source : Ville de Montréal, [Fréquentation du portail de données ouvertes](https://donnees.montreal.ca/dataset/frequentation-du-portail-de-donnees-ouvertes).
- Ressource utilisée : fichier de fréquentation depuis juillet 2021, téléchargé le 10 juillet 2026.
- Unité d'observation : une page du portail de données ouvertes observée pendant une journée.
- Transformation : conservation des lignes du 21 juin 2023 ayant au moins une session; aucune valeur n'est inventée.
- Licence : [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/).
- Limite importante : ces données décrivent le trafic web du portail et non l'utilisation, la qualité ou l'effet des jeux de données consultés.
