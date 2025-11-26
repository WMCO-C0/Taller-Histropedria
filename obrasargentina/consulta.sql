# Obras de arte (pinturas y esculturas) en dominio público - Argentina
SELECT DISTINCT ?work ?workLabel ?inception ?image ?genreLabel ?movementLabel WHERE {
  # Tipo de obra: pintura o escultura (incluye subclases)
  ?work wdt:P31/wdt:P279* ?type .
  VALUES ?type { wd:Q3305213 wd:Q860861 }  # pintura, escultura

  # País de origen de la obra: Argentina
  ?work wdt:P495 wd:Q414 .                 # country of origin = Argentina

  # Estado de copyright: dominio público
  ?work wdt:P6216 wd:Q19652 .              # copyright status = public domain

  # Fecha de creación de la obra
  OPTIONAL { ?work wdt:P571 ?inception . }

  # Imagen de la obra
  OPTIONAL { ?work wdt:P18  ?image . }

  # Género y movimiento artístico (si existen)
  OPTIONAL { ?work wdt:P136 ?genre . }
  OPTIONAL { ?work wdt:P135 ?movement . }

  # Etiquetas en español / inglés
  SERVICE wikibase:label { bd:serviceParam wikibase:language "es,en". }
}
ORDER BY ?inception ?workLabel
LIMIT 200
