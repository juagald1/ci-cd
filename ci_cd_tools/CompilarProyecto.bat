@echo off
set workspace=%1
set proyecto=%2

REM Se añde la ruta completa de (eclipse) a eclipsec.exe, ya que Jenkins no permite ejecutar directamente variables de path añadidas en el PC local
REM Añade el proyecto al workspace y lo sobreescribe si ya existe para evitar errores
REM C:\ti\ccs1120\ccs\eclipse\eclipsec -noSplash -data "C:\Users\Usuario\workspace" -application com.ti.ccstudio.apps.projectImport -ccs.location C:\Users\Usuario\Documents\GitHub\ci-cd -ccs.overwrite
C:\ti\ccs1120\ccs\eclipse\eclipsec -noSplash -data %workspace% -application com.ti.ccstudio.apps.projectImport -ccs.location C:\Users\Usuario\Documents\GitHub\ci-cd -ccs.overwrite

REM Crea archivo auxiliar para almacenar log de manera temporal
set "archivoTemporal=temp_output.txt"	

REM Se añde la ruta completa de (eclipse) a eclipsec.exe, ya que Jenkins no permite ejecutar directamente variables de path añadidas en el PC local
C:\ti\ccs1120\ccs\eclipse\eclipsec -noSplash -data %workspace% -application com.ti.ccstudio.apps.projectBuild -ccs.projects %proyecto% -ccs.configuration Debug > "%archivoTemporal%"

REM Copiado como ejemplo de ruta completa:
REM C:\ti\ccs1120\ccs\eclipse\eclipsec -noSplash -data "C:\Users\Usuario\workspace" -application com.ti.ccstudio.apps.projectBuild -ccs.projects test_28027 -ccs.configuration Debug > "%archivoTemporal%"

REM Muestra archivo temporal, resultado compilacion
type "%archivoTemporal%"

REM En funcion de la cadena de caracteres generada, retorna codigo (0,1,2) que Jenkins interpretara. Finalmente se elimina el archivo temporal
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
)else (    
    exit /b 0 REM Si no encuentra cadenas revisar rutas
)