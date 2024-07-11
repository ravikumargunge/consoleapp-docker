
# use the official Microsoft .NET SDK image to build and publish the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 as build

# set the wroking directory inside the container
WORKDIR /app

# Copy the .csproj file and restore any dependencies
COPY *.csproj .
RUN dotnet restore

# Copy the rest of the application code
COPY . .

 # Build the application
RUN dotnet publish -c Release -o out

# use the official Microsoft .NET Runtime image to run the application
FROM mcr.microsoft.com/dotnet/runtime:8.0 as RUNTIME

# Set the working directroy inside the container
WORKDIR /app

# Copy the published application from the build stage
COPY --from=build /app/out .

# Specify entry point for the application
ENTRYPOINT [ "dotnet","/src/out/consoleApp-Docker" ]
