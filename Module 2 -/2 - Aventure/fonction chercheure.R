

consulter_taches <- function(section) {
  taches <- list(
    "histogramme" = "Je veux voir la répartition des longueurs de nageoires des manchots. En effet, quand j'ai regardé, il me semblait y avoir une erreur dans les données. J'aimerai que tu m'aides à la trouver.",
    "statistiques_descriptives" = "Calculez la moyenne et la médiane des longueurs de nageoires pour chaque espèce."
  )
  return(taches[[section]])
}

repondre_chercheuse <- function(question) {
  reponses <- list(
    "distribution bec" = "Les longueurs de bec semblent suivre une distribution normale avec quelques valeurs extrêmes.",
    "longueur médiane nageoire" = "La combinaison île/espèce avec la longueur médiane de nageoire la plus faible est Adelie sur l'île Torgersen.",
    "bill_ratio" = "Le rapport moyen entre la longueur et la profondeur du bec est d'environ 3.2, ce qui confirme les observations de terrain.",
    "valeurs aberrantes" = "Oui, certaines valeurs aberrantes ont été détectées, notamment un manchot avec une nageoire de 400mm."
  )
  
  return(reponses[[question]])
}

verifier_valeur_aberrante <- function(ligne) {
  if (ligne == 5) {
    return("Oui, cette valeur est bien une aberration ! J'ai pu vérifier mes notes, et ca devrais être 193mm. Merci de modifier la base de données pour moi dans le dépôt Github.")
  } else {
    return("Hum ,j'ai bien vérifié il ne s'agit pas d'une valeur aberrantes, essayez encore !")
  }
}


