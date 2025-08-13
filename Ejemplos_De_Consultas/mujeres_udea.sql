# CONSULTA SPARQL: Mujeres graduadas de la Universidad de Antioquia
# Esta consulta busca información sobre mujeres que estudiaron en la UdeA
# y muestra sus datos de nacimiento, ubicación geográfica e imágenes

# ================================
# SECCIÓN SELECT: Definimos qué datos queremos obtener
# ================================
SELECT ?person ?personLabel ?birthPlaceLabel ?coordinates ?birthDate ?image

# ================================
# SECCIÓN WHERE: Definimos las condiciones de búsqueda
# ================================
WHERE {

  # FILTRO 1: Buscar personas que estudiaron en la Universidad de Antioquia
  # wdt:P69 = propiedad "educado en" 
  # wd:Q1258413 = identificador único de la Universidad de Antioquia en Wikidata
  ?person wdt:P69 wd:Q1258413 .
  
  # FILTRO 2: Filtrar solo mujeres
  # wdt:P21 = propiedad "sexo o género"
  # wd:Q6581072 = identificador único para "mujer" en Wikidata
  ?person wdt:P21 wd:Q6581072 .
  
  # FILTRO 3: Obtener el lugar de nacimiento
  # wdt:P19 = propiedad "lugar de nacimiento"
  # ?birthPlace es una variable que almacenará el lugar de nacimiento
  ?person wdt:P19 ?birthPlace .
  
  # FILTRO 4: Obtener las coordenadas geográficas del lugar de nacimiento
  # wdt:P625 = propiedad "coordenadas geográficas"
  # Esto nos permitirá ubicar los lugares en un mapa
  ?birthPlace wdt:P625 ?coordinates .
  
  # FILTRO 5: Obtener la fecha de nacimiento
  # wdt:P569 = propiedad "fecha de nacimiento"
  # Esto nos permitirá crear una línea de tiempo cronológica
  ?person wdt:P569 ?birthDate .  
  
  # FILTRO 6: Obtener imagen de la persona (si existe)
  # wdt:P18 = propiedad "imagen"
  # Esto nos ayudará a enriquecer visualmente los resultados
  ?person wdt:P18 ?image .
  
  # ================================
  # SERVICIO DE ETIQUETAS: Convierte IDs en nombres legibles
  # ================================
  # Este servicio automáticamente convierte los identificadores complejos
  # (como Q1258413) en nombres legibles (como "Universidad de Antioquia")
  
  SERVICE wikibase:label{
    # bd:serviceParam especifica parámetros del servicio
    # wikibase:language"es" indica que queremos las etiquetas en español
    bd:serviceParam wikibase:language"es"
  }

}

# ================================
# NOTAS IMPORTANTES PARA EL TALLER:
# ================================
# 1. Esta consulta funciona con Histropedia porque incluye:
#    - Fechas (?birthDate) para la línea de tiempo
#    - Coordenadas (?coordinates) para el componente geográfico
#    - Imágenes (?image) para enriquecer la visualización
#
# 2. Los puntos (.) al final de cada línea son OBLIGATORIOS en SPARQL
#    Indican el final de cada "triple" (sujeto-predicado-objeto)
#
# 3. Las variables siempre empiezan con ? (ejemplo: ?person, ?birthDate)
#
# 4. Los prefijos wdt: y wd: son específicos de Wikidata:
#    - wdt: para propiedades (relaciones entre entidades)
#    - wd: para entidades específicas (personas, lugares, conceptos)
#
# 5. Para modificar esta consulta podrías:
#    - Cambiar wd:Q1258413 por otra universidad
#    - Cambiar wd:Q6581072 por wd:Q6581097 para buscar hombres
#    - Agregar más filtros como profesión, nacionalidad, etc.