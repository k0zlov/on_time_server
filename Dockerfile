# Use latest stable channel SDK.
FROM dart:stable AS build

# Set working directory for app.
WORKDIR /app

# Copy pubspec files and resolve dependencies.
COPY pubspec.* ./
RUN dart pub get

# Copy the rest of the application source code.
COPY . .

# Compile the Dart application to an executable.
RUN dart compile exe lib/main.dart -o /app/main

# Build minimal serving image from AOT-compiled application.
FROM scratch

# Copy the Dart runtime from the build stage.
COPY --from=build /runtime/ /

# Copy the compiled application from the build stage.
COPY --from=build /app/main /app/

# Expose the port the application runs on.
EXPOSE 8080

# Set the default command to run the server.
CMD ["/app/main"]
