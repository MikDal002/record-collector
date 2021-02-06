FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /record-collector

COPY src/Krompaco.RecordCollector.Web/ src/Krompaco.RecordCollector.Web/
COPY src/Krompaco.RecordCollector.Content/ src/Krompaco.RecordCollector.Content/
COPY src/Krompaco.RecordCollector.Generator/ src/Krompaco.RecordCollector.Generator/
COPY .editorconfig .

# This is where you probably have your own content somewhere
COPY docs/content-record-collector-net/ docs/content-record-collector-net/

ENV ASPNETCORE_ENVIRONMENT Docker

WORKDIR /record-collector/src/Krompaco.RecordCollector.Generator

RUN echo $(ls -1 .)

ENTRYPOINT ["dotnet", "test", "Krompaco.RecordCollector.Generator.csproj", "--logger", "console;verbosity=detailed"]