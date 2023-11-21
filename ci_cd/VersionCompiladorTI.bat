@echo off
set ruta_archivo=%1
set frase_a_buscar=%2

:: Verificar si el archivo existe
if not exist "%ruta_archivo%" (
    echo El archivo "%ruta_archivo%" no existe.
    exit /b 1
)

:: Buscar la frase en el archivo
findstr /C:"%frase_a_buscar%" "%ruta_archivo%" >nul

:: Comprobar el código de salida de findstr
if %errorlevel% equ 0 (
    echo %frase_a_buscar%
    exit /b 0
) else (
	echo La version del compilador %frase_a_buscar% no es valida
    exit /b 1
)
