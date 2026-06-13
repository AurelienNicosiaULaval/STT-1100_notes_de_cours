# Comment rechercher et obtenir de l’aide efficacement ?

STT-1100 — Introduction à la science des données

# 🎯 Introduction

Un bon scientifique des données ne connaît pas tout par cœur… mais sait **où chercher** et **comment demander de l’aide** intelligemment. Ce guide vous accompagne pour apprendre à le faire efficacement et sans stress.

------------------------------------------------------------------------

# 📝 La *cheat sheet* du cours

Un **aide-mémoire synthétique** est disponible pour vous accompagner tout au long du cours. Cette *cheat sheet* rassemble :

- Les fonctions et commandes principales en R et tidyverse,
- Des exemples pratiques pour RStudio, GitHub et Quarto,
- Des rappels utiles pour nettoyer, visualiser et modéliser des données.

> Vous la trouverez dans le site de cours MonPortail, mise à jour régulièrement. N’hésitez pas à l’imprimer ou à l’avoir sous les yeux pendant vos aventures.

------------------------------------------------------------------------

# 🤖 GPT STT-1100 : votre assistant personnalisé

Nous avons conçu un **assistant GPT sur mesure pour ce cours** : [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-stt-1100)

> Il connaît les objectifs du cours, les modules, les défis et les librairies utilisées (comme `UlavalSSD`). Vous pouvez lui poser des questions spécifiques liées au cours, comme :
>
> - *“Comment importer un fichier `.csv` avec `readr` ?”*
> - *“Comment faire un graphique avec `ggplot2` pour une variable numérique ?”*
> - *“Quelles sont les bonnes pratiques pour rédiger un rapport reproductible avec Quarto ?”*

**Attention :** il ne remplace pas la réflexion critique ! Mais c’est un outil précieux pour progresser à votre rythme.

------------------------------------------------------------------------

# 🧭 Où chercher de l’aide ?

## 📌 Aide intégrée dans RStudio

- Tapez `?fonction` ou `help(fonction)` dans la console.
- Utilisez l’onglet **Help** de RStudio pour naviguer la documentation.
- Tapez `example(fonction)` pour obtenir un exemple prêt à l’emploi.
- Testez aussi la fonction `args(fonction)` pour voir les arguments attendus.

## 🌍 Recherche sur le Web

Des milliards de réponses vous attendent ! Voici quelques conseils pour bien formuler vos recherches :

> **TIP:**
>
> **Formulez vos questions comme un·e pro :**
>
> - Mauvais : `ça marche pas avec ggplot`
> - Meilleur : `ggplot2 how to add color by group in scatterplot`
>
> **Sites recommandés :**
>
> - [Stack Overflow](https://stackoverflow.com)
> - [Posit Community (anciennement RStudio Community)](https://community.rstudio.com/)
> - [GitHub](https://github.com/search?q=your+error+message)
> - [Google](https://www.google.com) — tapez “r ggplot histogram group by color”

------------------------------------------------------------------------

# 📘 Ressources du cours

## Livres et guides conseillés

- [**R for Data Science** (2e éd.)](https://r4ds.hadley.nz/)
  - Guide complet pour tout comprendre du tidyverse, des scripts, des graphiques, etc.
- [**The Tidyverse Style Guide**](https://style.tidyverse.org/)
  - Pour écrire du code clair, propre et compréhensible.
- [**Introduction to Modern Statistics**](https://openintro-ims.netlify.app/)
  - Une référence complémentaire qui met l’accent sur la visualisation, la modélisation, et la statistique moderne. Ce livre est aussi gratuit, clair et parfaitement adapté aux débutant·es.
- Les **aventures Quarto (.qmd)** sont là pour vous faire progresser pas à pas — n’hésitez pas à y revenir si vous êtes bloqué·e.

## Traduire et comprendre en français

Si l’anglais vous freine :

- Utilisez [**DeepL**](https://www.deepl.com/translator) pour traduire les explications ou messages d’erreurs.
- Le navigateur **Google Chrome** propose la **traduction automatique des pages**.
- N’hésitez pas à **demander à GPT STT-1100 de reformuler ou traduire** des passages.

> Les concepts restent les mêmes d’une langue à l’autre — l’important est de bien comprendre les idées derrière les commandes !

------------------------------------------------------------------------

# 👩‍🏫 Demander de l’aide efficacement

## 🤔 Avant de poser votre question

1.  Avez-vous lu le message d’erreur en entier ?
2.  Avez-vous essayé une recherche avec les mots clés ?
3.  Pouvez-vous isoler le problème dans un exemple simple ?

## 🗣️ Poser une bonne question (à [GPT STT-1100](https://chatgpt.com/g/g-682d165f32e881918633affa3fe9dfd6-stt-1100), à un·e assistant·e ou sur le forum)

- Soyez précis : indiquez le code **minimal** qui cause l’erreur.
- Copiez le **message d’erreur complet**.
- Décrivez ce que vous vouliez faire et ce qui se passe.

> **NOTE:**
>
> **Exemple :**
>
> > Je voulais filtrer les données pour les pingouins ayant un bec de plus de 40 mm.
> > Voici le code :
> > `penguins %>% filter(bill_length_mm > 40)`
> > Mais j’obtiens l’erreur suivante :
> > `object 'bill_length_mm' not found`

------------------------------------------------------------------------

# 🚨 Ne restez pas bloqué·e seul·e !

- 📩 **Écrivez au forum du cours.**
- 💬 **Travaillez en binôme ou en petits groupes**.
- 🧑‍🏫 **Venez poser votre question en classe ou à l’assistant·e**.
- 🤖 **Utilisez GPT STT-1100 intelligemment**, mais vérifiez ce qu’il vous répond.

------------------------------------------------------------------------

# 🎁 Bonus : les réflexes à adopter

✅ Cherchez l’information par vous-même en premier
✅ Documentez ce que vous apprenez (notes personnelles ou fichier `.qmd`)
✅ Osez poser des questions !
✅ Apprenez de vos erreurs (et de celles des autres)

------------------------------------------------------------------------

> 🧠 *Les meilleurs data scientists ne sont pas ceux qui ont toutes les réponses… mais ceux qui savent poser les bonnes questions.*
