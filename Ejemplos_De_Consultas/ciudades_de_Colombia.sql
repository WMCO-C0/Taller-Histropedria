# Definimos qué información queremos obtener de la consulta
SELECT ?ciudad ?ciudadLabel ?coordinates ?imagen ?birthDate

# El WHERE define las condiciones que deben cumplir los datos
WHERE{
  # Buscamos entidades (?ciudad) que sean del tipo "ciudad" 
  # wdt:P31 significa "es una instancia de"
  # wd:Q2555896 es el identificador de Wikidata para "ciudad"
  ?ciudad wdt:P31 wd:Q2555896 .
  
  # La ciudad debe tener una imagen
  # wdt:P18 es la propiedad "imagen" en Wikidata
  ?ciudad wdt:P18 ?imagen .
  
  # La ciudad debe tener fecha de nacimiento/fundación
  # wdt:P571 es la propiedad "fecha de inicio/creación"
  ?ciudad wdt:P571 ?birthDate . 
  
  # La ciudad debe tener coordenadas geográficas
  # wdt:P625 es la propiedad "coordenadas"
  ?ciudad wdt:P625 ?coordinates .
           
  # Este servicio convierte los identificadores en etiquetas legibles
  # Nos da los nombres en español de las ciudades
  SERVICE wikibase:label{
    bd:serviceParam wikibase:language "es"
  }
}