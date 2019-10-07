# escape=`

FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2018

SHELL [ "powershell" ]

RUN Set-ExecutionPolicy Bypass -Scope Process -Force; `
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#ADD https://aka.ms/vs/16/release/vs_buildtools.exe C:\TEMP\vs_buildtools.exe
#RUN C:\TEMP\vs_buildtools.exe --quiet --wait --norestart --nocache

RUN choco install -y visualstudio2019buildtools
RUN choco install -y git --params '/GitOnlyOnPath /NoGitLfs /NoShellIntegration'

CMD [ "powershell" ]