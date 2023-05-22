FROM maven:latest
RUN mkdir -p /app/source
COPY . /app/source
WORKDIR /app/source
RUN cd /app/source && mvn clean install -Dskiptest