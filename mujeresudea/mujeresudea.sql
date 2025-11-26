# Mujeres asociadas a la Universidad de Antioquia (alumnas)
SELECT DISTINCT ?person ?personLabel ?birth ?image ?fieldLabel WHERE {
  ?person wdt:P31 wd:Q5 .                # humano
  ?person wdt:P69 wd:Q1258413 .          # educated at: Universidad de Antioquia
  ?person wdt:P21 wd:Q6581072 .          # sexo / género: femenino

  OPTIONAL { ?person wdt:P569 ?birth . } # fecha de nacimiento
  OPTIONAL { ?person wdt:P18  ?image . } # imagen
  OPTIONAL { ?person wdt:P101 ?field . } # campo de trabajo
  SERVICE wikibase:label { bd:serviceParam wikibase:language "es,en". }
}
ORDER BY ?birth ?personLabel
LIMIT 200