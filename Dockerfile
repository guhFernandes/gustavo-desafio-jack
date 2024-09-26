FROM nginx:alpine

RUN adduser -D -g 'www' desafio-jack

COPY index.html ./usr/share/nginx/html/index.html

COPY ./custom_nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx /var/temp/nginx && \
    chown -R desafio-jack /var/cache/nginx /var/run /var/log/nginx /var/temp/nginx

RUN chown -R desafio-jack /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

USER desafio-jack

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;"]