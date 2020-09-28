FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as build

ARG VERSION="0.0.0.0-local"
ARG CREATED=unknown

WORKDIR /app

COPY . ./
RUN dotnet restore && \
 dotnet test ./tests/Echo.Api.Tests/Echo.Api.Tests.csproj -c Release --logger "trx;LogFileName=testresults.trx" 
RUN dotnet publish ./src/Echo.Api/Echo.Api.csproj -c Release -o output

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1.8-alpine3.12 as runtime
WORKDIR /app
COPY --from=build /app/output ./
EXPOSE 80
ENV ECHO_APP_NAME=default
ENV ASPNETCORE_URLS=http://+:80
ENV DOTNET_RUNNING_IN_CONTAINER=true

LABEL org.opencontainers.image.created="${CREATED}"
LABEL org.opencontainers.image.authors="https://github.com/asizikov"
LABEL org.opencontainers.image.source="https://github.com/asizikov/asp-net-container"
LABEL org.opencontainers.image.version="${VERSION}"

ENTRYPOINT ["dotnet", "Echo.Api.dll"]