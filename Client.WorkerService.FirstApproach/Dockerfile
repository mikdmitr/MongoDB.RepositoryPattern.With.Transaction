#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/runtime:7.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["Client.WorkerService.FirstApproach/Client.WorkerService.FirstApproach.csproj", "Client.WorkerService.FirstApproach/"]
COPY ["Shared/Shared.csproj", "Shared/"]
RUN dotnet restore "Client.WorkerService.FirstApproach/Client.WorkerService.FirstApproach.csproj"
COPY . .
WORKDIR "/src/Client.WorkerService.FirstApproach"
RUN dotnet build "Client.WorkerService.FirstApproach.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Client.WorkerService.FirstApproach.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Client.WorkerService.FirstApproach.dll"]