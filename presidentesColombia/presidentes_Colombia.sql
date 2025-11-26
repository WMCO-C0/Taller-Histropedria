  # Query SPARQL: busca personas (P31=Q5) con el cargo P39 igual a Presidente de Colombia (Q853475).
      # P580 / P582: fecha de inicio y fin del mandato. P18: imagen. El servicio de etiquetas retorna nombres en es/en.
      SELECT DISTINCT ?person ?personLabel ?start ?end ?image WHERE {
        ?person wdt:P31 wd:Q5 .
        ?person p:P39 ?statement .
        ?statement ps:P39 wd:Q853475 .
        OPTIONAL { ?statement pq:P580 ?start }
        OPTIONAL { ?statement pq:P582 ?end }
        OPTIONAL { ?person wdt:P18 ?image }
        SERVICE wikibase:label { bd:serviceParam wikibase:language "es,en". }
      }
      ORDER BY ?start
      LIMIT 50