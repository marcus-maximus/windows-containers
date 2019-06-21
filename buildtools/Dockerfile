FROM mcr.microsoft.com/windows/servercore:1803

SHELL [ "powershell" ]

RUN Set-ExecutionPolicy Bypass -Scope Process -Force; \
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

RUN choco install visualstudio2019buildtools

CMD [ "powershell" ]