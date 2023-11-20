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
C:\ti\ccs1120\ccs\eclipse\eclipsec -noSplash -data "%workspace%" -application com.ti.ccstudio.apps.projectBuild -ccs.projects "%proyecto%" -ccs.configuration Debug > "%archivoTemporal%"

rem Imprimir .txt
type "%archivoTemporal%"

rem Buscar una palabra específica dentro del archivo temporal
set "palabraABuscar=CCS headless build complete! 0 out of 0 projects have errors."
findstr /C:"%palabraABuscar%" "%archivoTemporal%" > nul

if %errorlevel% equ 0 (
	del "temp_output.txt"
	exit /b 0
)

set "palabraABuscar=CCS headless build complete! 0 out of 1 projects have errors."
findstr /C:"%palabraABuscar%" "%archivoTemporal%" > nul

if %errorlevel% equ 0 (
	del "temp_output.txt"
	exit /b 1
)

set "palabraABuscar=CCS headless build complete! 1 out of 1 projects have errors."
findstr /C:"%palabraABuscar%" "%archivoTemporal%" >nul

if %errorlevel% equ 0 (
	del "temp_output.txt"
	exit /b 2
)




REM C:\ti\ccs1120\ccs\eclipse\eclipsec -noSplash -data C:\Users\Usuario\workspace -application com.ti.ccstudio.apps.projectBuild -ccs.projects test_28027 -ccs.configuration Debug
