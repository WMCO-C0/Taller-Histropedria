# Obras de arte (pinturas y esculturas) en dominio público - Uruguay
SELECT DISTINCT ?work ?workLabel ?inception ?image ?museumLabel WHERE {
  # Tipo de obra: pintura o escultura
  ?work wdt:P31/wdt:P279* ?type .
  VALUES ?type { wd:Q3305213 wd:Q860861 }  # pintura, escultura

  # País de origen Uruguay O bien en colección de un museo uruguayo (si está indicado)
  {
    ?work wdt:P495 wd:Q77 .                # country of origin = Uruguay
  }
  UNION
  {
    ?work wdt:P195 ?museum .               # colección de un museo
    ?museum wdt:P17 wd:Q77 .              # cuya sede está en Uruguay
  }

  # Estado de copyright: dominio público
  ?work wdt:P6216 wd:Q19652 .

  # Fecha de creación
  OPTIONAL { ?work wdt:P571 ?inception . }

  # Imagen de la obra
  OPTIONAL { ?work wdt:P18  ?image . }

  # Museo (si existe)
  OPTIONAL { ?work wdt:P195 ?museum . }

  SERVICE wikibase:label { bd:serviceParam wikibase:language "es,en". }
}
ORDER BY ?inception ?workLabel
LIMIT 200
