FROM nginx:1.11.9 
MAINTAINER Ed & Magdalena 
EXPOSE 8080
RUN builddate=$(date -d)
COPY nginx.conf /etc/nginx/
//RUN groupadd -r nginxuser && useradd -r -g nginxuser nginxuser
USER nginx
RUN /etc/init.d/nginx start 
// ENTRYPOINT

