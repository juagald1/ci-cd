@echo off
set workspace=%1
set proyecto=%2
set "archivoTemporal=temp_output.txt"	

REM 1 Ruta completa de eclipsec, Jenkins no permite ejecutar directamente variables de path añadidas en el PC local
REM 2 Ruta a Workspace (si el proyecto ha sido compilado al menos 1 vez, lo añade automaticamente a la carpeta .metadata de workspace)
REM 3 Nombre del proyecto (-ccs.projects)
REM 4 Carpeta Debug de proyecto (-ccs.configuration)

rem Ejecutar el comando y guarda la salida en .txt temporal con '>'
C:\ti\ccs1200\ccs\eclipse\eclipsec -noSplash -data "%workspace%" -application com.ti.ccstudio.apps.projectBuild -ccs.projects "%proyecto%" -ccs.configuration Debug > "%archivoTemporal%"

rem Muestra archivo temporal
type "%archivoTemporal%"

rem En funcion de la cadena de caracterers generada, retorna un codigo que Jenkins interpretara
rem Finalmente elimina el archivo temporal
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