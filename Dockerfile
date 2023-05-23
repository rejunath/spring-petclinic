FROM maven as build
RUN mkdir -p /app/source
COPY . /app/source
WORKDIR /app/source
RUN cd /app/source && mvn clean install -Dskiptest

FROM build
COPY --from=build /app/source/target/*.jar /app/app.jar
CMD ["java","-jar", "/app/app.jar"]
