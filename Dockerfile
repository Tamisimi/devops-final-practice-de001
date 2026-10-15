# Stage 1 – build
FROM gradle:8.7-jdk21-alpine AS build
WORKDIR /app

COPY build.gradle settings.gradle ./
COPY gradle ./gradle
RUN gradle dependencies --no-daemon || true

COPY src ./src
RUN gradle bootJar -x test --no-daemon

# Stage 2 – runtime
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

RUN adduser -D -u 1000 appuser

ARG APP_VERSION=local
ENV APP_VERSION=${APP_VERSION}

COPY --from=build /app/build/libs/app.jar app.jar
RUN chown appuser:appuser app.jar

USER appuser
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
