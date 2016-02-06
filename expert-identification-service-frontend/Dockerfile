FROM learninglayers/base
MAINTAINER Cagatay Ogut <ogut@dbis@rwth-aachen.de>

RUN apt-get update
RUN apt-get -qqy --no-install-recommends install \
    nginx \
    wget \
    unzip

RUN wget -O EIS_Frontend.zip https://www.dropbox.com/s/hgmrql6ozaufigt/EIS_Frontend.zip?dl=1 \
  && unzip EIS_Frontend.zip
RUN mv EIS_Frontend /usr/share/nginx/html/eis-frontend
WORKDIR /usr/share/nginx/html/eis-frontend

# Provide default port if random port mapping invoked
EXPOSE 80

# Do not daemonze
RUN echo 'daemon off;' >> /etc/nginx/nginx.conf

CMD sed -i "s#\(data-server=\).*#\1\"${LAYERS_API_URI}o/oauth2\"#" app/views/login.html && \
    sed -i "s#\(data-clientid=\).*#\1\"${EIS_OIDC_CLIENT_ID}\"#" app/views/login.html && \
    sed -i "s#$rootScope.baseUrl .*#$rootScope.baseUrl = \"${LAYERS_API_URI}\";#" app/scripts/controllers/controllers.js && \
    nginx

