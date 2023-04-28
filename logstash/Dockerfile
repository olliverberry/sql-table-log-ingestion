FROM docker.elastic.co/logstash/logstash:8.7.0
WORKDIR /usr/share/logstash
RUN rm -f ./pipeline/logstash.conf
RUN logstash-plugin install logstash-output-datadog_logs
RUN curl -L -s -o ./logstash-core/lib/jars/mssql-jdbc-12.2.0.jre8.jar \
    https://github.com/microsoft/mssql-jdbc/releases/download/v12.2.0/mssql-jdbc-12.2.0.jre8.jar
RUN chown logstash ./logstash-core/lib/jars/mssql-jdbc-12.2.0.jre8.jar
COPY --chown=logstash ./pipeline/logstash.conf ./pipeline/
COPY --chown=logstash ./entrypoint.sh .
ENTRYPOINT [ "./entrypoint.sh" ]