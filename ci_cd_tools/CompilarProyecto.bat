@echo off
REM 1 Ruta completa de eclipsec, Jenkins no permite ejecutar directamente variables de path añadidas en el PC
REM 2 Ruta a Workspace (si el proyecto ha sido compilado al menos 1 vez, lo añade automaticamente a la carpeta .metadata de workspace)
REM 3 Nombre del proyecto (-ccs.projects)
REM 4 Carpeta Debug de proyecto (-ccs.configuration)

set workspace=%1
set proyecto=%2

rem C:\ti\ccs1120\ccs\eclipse\eclipsec -noSplash -data "%workspace%" -application com.ti.ccstudio.apps.projectBuild -ccs.projects "%proyecto%" -ccs.configuration Debug

rem Ejecutar el comando '>' y guarda la salida en archivo temporal
set "archivoTemporal=temp_output.txt"
C:\ti\ccs1120\ccs\eclipse\eclipsec -noSplash -data C:\Users\Usuario\workspace -application com.ti.ccstudio.apps.projectBuild -ccs.projects test_28027 -ccs.configuration Debug > "%archivoTemporal%"

rem Imprimir .txt
type "%archivoTemporal%"

rem Buscar una palabra específica dentro del archivo temporal
set "palabraABuscar=CCS headless build complete! 1 out of 1 projects have errors."
findstr /C:"%palabraABuscar%" "%archivoTemporal%"

if %errorlevel% equ 0 (
	exit /b 1
)

rem Espera opcional para que puedas ver el resultado antes de cerrar la ventana
pause





rem Espera opcional para que puedas ver el resultado antes de cerrar la ventana



REM C:\ti\ccs1120\ccs\eclipse\eclipsec -noSplash -data C:\Users\Usuario\workspace -application com.ti.ccstudio.apps.projectBuild -ccs.projects test_28027 -ccs.configuration Debug
