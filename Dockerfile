FROM mcr.microsoft.com/dotnet/core/sdk:3.1


ARG VERSION="0.0.0.0-local"
ARG CREATED=unknown

WORKDIR /app

COPY . ./
RUN ls -a
RUN dotnet restore
RUN dotnet test
RUN dotnet publish -c Release -o output

EXPOSE 80
ENV ECHO_APP_NAME=default
ENV ASPNETCORE_URLS=http://+:80
ENV DOTNET_RUNNING_IN_CONTAINER=true

LABEL org.opencontainers.image.created="${CREATED}"
LABEL org.opencontainers.image.authors="https://github.com/asizikov"
LABEL org.opencontainers.image.source="https://github.com/asizikov/asp-net-container"
LABEL org.opencontainers.image.version="${VERSION}"

WORKDIR /app/output
ENTRYPOINT ["dotnet", "Echo.Api.dll"]