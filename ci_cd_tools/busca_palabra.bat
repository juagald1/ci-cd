@echo off
set "carpeta_archivo=C:\Users\Juan\Documents\GitHub\ci-cd\Debug"
set "archivo_map=%carpeta_archivo%\test_28027.map"
set "palabra_a_buscar=v22.6.0"

findstr /i /c:"%palabra_a_buscar%" "%archivo_map%"

pause