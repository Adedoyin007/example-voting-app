# Build stage
FROM --platform=${BUILDPLATFORM} mcr.microsoft.com/dotnet/sdk:10.0@sha256:0d99ebf1ccad15037b5c98c9fe8979d6b8dbac23812feae2277a0b277b5c5ffa AS build

ARG TARGETARCH
ARG BUILDPLATFORM
ARG TARGETPLATFORM

RUN echo "Building for $TARGETPLATFORM on $BUILDPLATFORM"

WORKDIR /source

COPY *.csproj ./
RUN dotnet restore -a $TARGETARCH

COPY . .
RUN dotnet publish -c Release -o /app -a $TARGETARCH --self-contained false --no-restore

# Runtime stage
FROM mcr.microsoft.com/dotnet/runtime:10.0@sha256:939555726cae4c916d212323ac3c0792996dcac2614f00e82cc40fcf059e1af3

WORKDIR /app

COPY --from=build --chown=app:app /app .

USER app

ENTRYPOINT ["dotnet", "Worker.dll"]