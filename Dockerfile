FROM nginx:stable
LABEL 'creator': Janik Möller <janik.moeller@gmail.com>

COPY git/eleventy/_site /usr/share/nginx/html
