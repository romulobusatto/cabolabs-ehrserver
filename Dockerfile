FROM java
ENV DEBIAN_FRONTEND noninteractive


# install grails
RUN curl -L https://github.com/grails/grails-core/releases/download/v2.5.6/grails-2.5.6.zip  -o /grails.zip
# COPY grails-2.5.6.zip /grails.zip
RUN unzip /grails.zip -d /opt
ADD . /app

WORKDIR /app

ENV GRAILS_HOME /opt/grails-2.5.6
ENV PATH $GRAILS_HOME/bin:$PATH
ENV MYSQL_DATABASE ehrserver
ENV EHRSERVER_REST_SECRET e339ad18-127c-4ce4-8d2d-58447323bcd0

EXPOSE 8090
RUN grails dependency-report
RUN chmod +x /app/docker-entrypoint.sh
# Define default command.
ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["grails", "-Dserver.port=8090", "run-app"]
