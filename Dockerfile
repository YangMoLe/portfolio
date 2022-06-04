FROM nginx:stable
LABEL 'creator': Janik Möller <janik.moeller@gmail.com>

COPY _site /usr/share/nginx/html
