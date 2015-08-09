#
# A nginx server
#  - Uses volume /www

FROM nginx

VOLUME ["/www/"]

# TODO: Fix this by editing the config file
RUN rm -Rf /usr/share/nginx/html/
RUN ln -s /www /usr/share/nginx/html
