@echo off
REM 1 Ruta completa de eclipsec, Jenkins no permite ejecutar directamente variables de path añadidas en el PC
REM 2 Ruta a Workspace (si el proyecto ha sido compilado al menos 1 vez, lo añade automaticamente a la carpeta .metadata de workspace)
REM 3 Nombre del proyecto (-ccs.projects)
REM 4 Carpeta Debug de proyecto (-ccs.configuration)

set workspace=%1
set proyecto=%2

C:\ti\ccs1120\ccs\eclipse\eclipsec -noSplash -data "%workspace%" -application com.ti.ccstudio.apps.projectBuild -ccs.projects "%proyecto%" -ccs.configuration Debug
