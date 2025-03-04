FROM nginx:latest
MAINTAINER  Moucharaf(moucharafamadou0@gmail.com)

RUN apt-get update && \
    apt-get install -y git 
    
RUN rm -rf /usr/share/nginx/html

RUN git clone https://github.com/diranetafen/static-website-example.git /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
