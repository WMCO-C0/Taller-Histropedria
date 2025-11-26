# Películas en dominio público en el mundo
SELECT DISTINCT ?film ?filmLabel ?pubDate ?countryLabel ?directorLabel ?image WHERE {
  ?film wdt:P31/wdt:P279* wd:Q11424 .   # instancia/subclase de película
  ?film wdt:P6216 wd:Q19652 .           # estado de copyright: dominio público

  OPTIONAL { ?film wdt:P577 ?pubDate . }   # fecha de estreno / publicación
  OPTIONAL { ?film wdt:P495 ?country . }
  OPTIONAL { ?film wdt:P57  ?director . }
  OPTIONAL { ?film wdt:P18  ?image . }

  SERVICE wikibase:label { bd:serviceParam wikibase:language "es,en". }
}
ORDER BY ?pubDate
LIMIT 200
