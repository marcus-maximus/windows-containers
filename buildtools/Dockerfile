FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-1803

SHELL [ "powershell" ]

RUN Set-ExecutionPolicy Bypass -Scope Process -Force; \
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

RUN choco install -y visualstudio2019buildtools --package-parameters \
        "'--add Microsoft.VisualStudio.Workload.VCTools \
          --includeRecommended'"
RUN choco install -y git --params "'/GitOnlyOnPath /NoGitLfs /NoShellIntegration'"
RUN choco install -y cmake --installargs "ADD_CMAKE_TO_PATH=System"

RUN git clone https://github.com/Microsoft/vcpkg.git; \
    cd vcpkg; \
    .\bootstrap-vcpkg.bat

CMD [ "powershell" ]