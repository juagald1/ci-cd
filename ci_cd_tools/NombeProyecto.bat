@echo off
setlocal enabledelayedexpansion

REM Establecer el directorio base y la extensión del archivo a buscar
set directorio=%1
set "extension=.out"

REM Inicializar la lista de archivos encontrados
set "archivos_encontrados="

REM Utilizar el comando for para iterar a través de los archivos en el directorio y sus subdirectorios
for /r "%directorio%" %%i in (*%extension%) do (
    set "nombre_archivo=%%~ni"  REM Obtener solo el nombre del archivo sin extensión
    set "archivos_encontrados=!archivos_encontrados!!nombre_archivo!"
)

echo %archivos_encontrados%

endlocal
exit /b 0
