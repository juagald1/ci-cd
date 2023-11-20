@echo off
set ruta_archivo=%1
set nombre_proyecto=%2

eclipsec -noSplash -data "%ruta_archivo%" -application com.ti.ccstudio.apps.projectBuild -ccs.projects %nombre_proyecto% -ccs.configuration Debug
