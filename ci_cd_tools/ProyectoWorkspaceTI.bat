@echo off
set rutaworkspace=%1
set rutaproyecto=%2

REM Se añde la ruta completa de (eclipse) a eclipsec.exe, ya que Jenkins no permite ejecutar directamente variables de path añadidas en el PC local
REM Añade el proyecto al workspace y lo sobreescribe si ya existe para evitar errores
C:\ti\ccs1120\ccs\eclipse\eclipsec -noSplash -data %rutaworkspace% -application com.ti.ccstudio.apps.projectImport -ccs.location %rutaproyecto% -ccs.overwrite