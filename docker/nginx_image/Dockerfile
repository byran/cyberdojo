FROM nginx:1.9
MAINTAINER Jon Jagger <jon@jaggersoft.com>

RUN rm -rf /usr/share/nginx/html
COPY public /usr/share/nginx/html
COPY docker/nginx_image/nginx.conf /etc/nginx/conf.d/default.conf
