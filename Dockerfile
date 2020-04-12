#Partimos de la ultima (latest) imagen de engine
#Incluye la inicialización del engine en modo daemon y que ejecute el
#directorio "DocumentRoot"
FROM nginx:latest
# Copiamos el contenido a ejecutar al "DocumentRoot" definido en la plantilla de engine
COPY startbootstrap-resume-gh-pages /user/share/nginx/html
EXPOSE 80