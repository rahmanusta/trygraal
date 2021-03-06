FROM openjdk:10-jdk-slim
MAINTAINER Rahman Usta
ENV shell="/opt/graalvm/bin/polyglot --shell"
#RUN apt-get update -y && apt-get install sudo vim -y
VOLUME /tmp
WORKDIR /opt/trygraal/
COPY ./graalvm-0.32 /opt/graalvm
COPY target/trygraal.jar .
RUN useradd -ms /bin/bash trygraal
RUN chmod -R  a+w /tmp || true
RUN chmod -R  a+w /home/trygraal/ || true
RUN chmod -R  a+x /usr/bin/java || true
RUN chown -R trygraal:trygraal /opt/graalvm
USER trygraal
CMD ["java","-jar","./trygraal.jar"]