# Obras en dominio público de museos colombianos
SELECT DISTINCT ?work ?workLabel ?inception ?museumLabel ?image WHERE {
  VALUES ?museum { wd:Q671264 wd:Q2377645 }   # Museo Nacional de Colombia, Museo de Antioquia
  ?work wdt:P195 ?museum .                    # en la colección del museo

  ?work wdt:P31/wdt:P279* ?type .
  VALUES ?type { wd:Q3305213 wd:Q860861 }     # pintura o escultura

  ?work wdt:P6216 wd:Q19652 .                 # dominio público

  OPTIONAL { ?work wdt:P571 ?inception . }    # fecha de creación
  OPTIONAL { ?work wdt:P18  ?image . }

  SERVICE wikibase:label { bd:serviceParam wikibase:language "es,en". }
}
ORDER BY ?inception ?workLabel
LIMIT 200
