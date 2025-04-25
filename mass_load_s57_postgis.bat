@echo off
setlocal enabledelayedexpansion

REM Vérifie qu'un répertoire a été fourni
if "%~1"=="" (
    echo Usage: %0 directory000 
    exit /b 1
)

REM Récupère l'argument
set "directory=%~1"

REM Itère sur tous les fichiers .000 dans le répertoire
for /r "%directory%" %%i in (*.000) do (
    echo Traitement du fichier: %%i

    ogr2ogr -skipfailures -append -update -s_srs EPSG:4326 -t_srs EPSG:4326 ^
        -where "OGR_GEOMETRY='POINT' or OGR_GEOMETRY='MULTIPOINT'" ^
        -oo RETURN_PRIMITIVES=ON -oo SPLIT_MULTIPOINT=ON -oo RETURN_LINKAGES=ON -oo LNAM_REFS=ON -oo ADD_SOUNDG_DEPTH=ON ^
        -nlt MULTIPOINT -f PostgreSQL ^
        PG:"dbname=postgis_34_sample host=localhost port=5432 user=postgres password=1touria+ active_schema=pointsenc" %%i

    ogr2ogr -skipfailures -append -update -nln pointsDSID -f PostgreSQL ^
        PG:"dbname=postgis_34_sample host=localhost port=5432 user=postgres password=1touria+ active_schema=pointsenc" %%i DSID

    ogr2ogr -skipfailures -append -update -s_srs EPSG:4326 -t_srs EPSG:4326 ^
        -where "OGR_GEOMETRY='LINESTRING' or OGR_GEOMETRY='MULTILINESTRING'" ^
        -oo RETURN_PRIMITIVES=ON -oo SPLIT_MULTIPOINT=ON -oo RETURN_LINKAGES=ON -oo LNAM_REFS=ON ^
        -f PostgreSQL PG:"dbname=postgis_34_sample host=localhost port=5432 user=postgres password=1touria+ active_schema=linesenc" %%i

    ogr2ogr -skipfailures -append -update -nln linesDSID -f PostgreSQL ^
        PG:"dbname=postgis_34_sample host=localhost port=5432 user=postgres password=1touria+ active_schema=linesenc" %%i DSID

    ogr2ogr -skipfailures -append -update -s_srs EPSG:4326 -t_srs EPSG:4326 ^
        -where "OGR_GEOMETRY='POLYGON' or OGR_GEOMETRY='MULTIPOLYGON'" ^
        -oo RETURN_PRIMITIVES=ON -oo SPLIT_MULTIPOINT=ON -oo RETURN_LINKAGES=ON -oo LNAM_REFS=ON ^
        -f PostgreSQL PG:"dbname=postgis_34_sample host=localhost port=5432 user=postgres password=1touria+ active_schema=polysenc" %%i

    ogr2ogr -skipfailures -append -update -nln polysDSID -f PostgreSQL ^
        PG:"dbname=postgis_34_sample host=localhost port=5432 user=postgres password=1touria+ active_schema=polysenc" %%i DSID
)

echo Traitement terminé.
pause
