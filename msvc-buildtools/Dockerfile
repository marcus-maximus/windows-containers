# escape=`

ARG FROM_IMAGE=mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2019
FROM ${FROM_IMAGE}

SHELL ["cmd", "/S", "/C"]

# Set up environment to collect install errors.
COPY Install.cmd C:\TEMP\
ADD https://aka.ms/vscollect.exe C:\TEMP\collect.exe

# Download channel for fixed install.
ARG CHANNEL_URL=https://aka.ms/vs/16/release/channel
ADD ${CHANNEL_URL} C:\TEMP\VisualStudio.chman

# Install Visual Studio build tools
ADD https://aka.ms/vs/16/release/vs_buildtools.exe C:\TEMP\vs_buildtools.exe
RUN C:\TEMP\Install.cmd C:\TEMP\vs_buildtools.exe --quiet --wait --norestart --nocache `
    --channelUri C:\TEMP\VisualStudio.chman `
    --installChannelUri C:\TEMP\VisualStudio.chman `
    --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended`
    --installPath C:\BuildTools

SHELL [ "powershell", "-Command" ]

# Install Chocolatey
RUN Set-ExecutionPolicy Bypass -Scope Process -Force; `
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install cmake
RUN choco install -y cmake --installargs "ADD_CMAKE_TO_PATH=System"

# Install git
RUN choco install -y git --params '/GitOnlyOnPath /NoGitLfs /NoShellIntegration'

# Install vcpkg
RUN git clone https://github.com/Microsoft/vcpkg.git; `
    cd vcpkg; `
    .\bootstrap-vcpkg.bat

COPY .\Tests.ps1 C:\Tests.ps1

SHELL ["cmd", "/S", "/C"]
ENTRYPOINT "C:\BuildTools\Common7\Tools\VsDevCmd.bat && powershell"