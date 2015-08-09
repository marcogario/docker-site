#
# Data container for a website
#
# This exports 3 volumes:
#  - /git
#  - /www
#  - /etc/nginx (TODO)
#
# /git can be used to provide git-backed functionalities
#
# /www can be used to provide the website for nginx
#
# /etc/nginx (TODO) contains the configuration of the nginx server
#

FROM debian:latest

VOLUME ["/git", "/www"]

RUN chown 1000:1000 /git
RUN chown 1000:1000 /www

