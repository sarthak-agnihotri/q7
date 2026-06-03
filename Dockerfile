FROM amazoncorretto:17
WORKDIR /app
COPY target/q7-1.0.jar app.jar
EXPOSE 8083
CMD ["java","-jar","app.jar"]