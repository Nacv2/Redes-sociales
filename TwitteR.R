# instala el paquete twitteR junto a sus dependencias
# (ejecutar solo si no se tiene el paquete instalado)
install.packages("twitteR")

# llama el paquete twitteR para utilizar sus funciones
library("twitteR")

# acceso a la app (es necesario crearla junto a una
# token de acceso en https://apps.twitter.com)
setup_twitter_oauth("Consumer Key", 
                    "Consumer secret", 
                    "Access Token", 
                    "Access Token secret")

# selecciona las últimas 3200 publicaciones de 'adidasCO'
timeline <- userTimeline("adidasCO", n=3200)

# extrae la información relevante de las publicaciones
# asignadas a timeline (retweets, favoritos, fechas)
timelined <- twListToDF(timeline)
head(timelined)

# obtiene los estadísticos de resumen para el
# número de favoritos que recibió cada tweet
summary(timelined$favoriteCount)
# desviación estándar
sd(timelined$favoriteCount)

# obtiene los estadísticos de resumen para el
# número de retweets que recibió cada tweet
summary(timelined$retweetCount)
# desviación estándar
sd(timelined$retweetCount)

# establece como directorio de trabajo el Escritorio
# para leer o añadir archivos (modificar el nombre
# de usuario)
setwd("C:/Users/personal/Desktop")

# guarda la información en el archivo "adidasCO.csv"
write.csv2(timelined , "adidasCO.csv")

# Comparación
timeline2 <- userTimeline("tennis_venus", n=3200)
timeline2d <- twListToDF(timeline2)

summary(timelined$favoriteCount)
summary(timeline2d$favoriteCount)

summary(timelined$retweetCount)
summary(timeline2d$retweetCount)

write.csv2(timeline2d , "tennis_venus.csv")
