CREATE OR REPLACE FUNCTION create_fields_and_update_values_pointsenc()

RETURNS TRIGGER AS
$$
DECLARE
table_record RECORD;
tables_import RECORD;
enc_chart_value TEXT;
scale_value NUMERIC;
purpose_value NUMERIC;
empty_tables int;
BEGIN
--Le code suivant permet de supprimer les tables vides d'un schéma d'import:
FOR table_record IN SELECT table_name FROM information_schema.tables WHERE table_schema = 'pointsenc' AND table_name != 'pointsdsid' LOOP
-- Composer une requête dynamique pour vérifier si la table est vide
EXECUTE format('SELECT COUNT(*) FROM pointsenc.%I', table_record.table_name) INTO empty_tables;

-- Si le nombre de lignes est égal à zéro, supprimer la table
    IF empty_tables = 0 THEN
        EXECUTE format('DROP TABLE IF EXISTS pointsenc.%I CASCADE',  table_record.table_name);
        RAISE NOTICE 'Table pointsenc.%I supprimée car elle est vide.',  table_record.table_name;
    END IF;
END LOOP;

-- Parcours de toutes les tables du schéma pointsenc 
FOR table_record IN SELECT table_name FROM information_schema.tables WHERE table_schema = 'pointsenc' AND table_name != 'pointsdsid' LOOP
    -- Vérifie si les champs enc_chart et scale n'existent pas dans la table actuelle
    IF NOT EXISTS (
        SELECT column_name FROM information_schema.columns
        WHERE table_schema = 'pointsenc' AND table_name = table_record.table_name AND column_name IN ('enc_chart', 'scale','purpose')
    ) THEN
        -- Crée le champ enc_chart de type texte
        EXECUTE format('ALTER TABLE pointsenc.%I ADD COLUMN enc_chart TEXT', table_record.table_name);
        -- Crée le champ scale de type numérique
        EXECUTE format('ALTER TABLE pointsenc.%I ADD COLUMN scale NUMERIC', table_record.table_name);
        -- Crée le champ purpose de type numérique
        EXECUTE format('ALTER TABLE pointsenc.%I ADD COLUMN purpose NUMERIC', table_record.table_name);
            IF NOT EXISTS (
                SELECT column_name FROM information_schema.columns
                WHERE table_schema = 'pointsenc' AND table_name = table_record.table_name AND column_name IN ('posacc','quapos')
                ) THEN
                -- Crée le champ POSACC de type numérique
                EXECUTE format('ALTER TABLE pointsenc.%I ADD COLUMN posacc NUMERIC(10,0)', table_record.table_name);
                -- Crée le champ QUAPOS de type numérique
                EXECUTE format('ALTER TABLE pointsenc.%I ADD COLUMN quapos INTEGER', table_record.table_name);
            END IF;
        RAISE NOTICE 'Champs enc_chart, scale , purpose, POSACC et QUIAPOS créés dans la table %', table_record.table_name;

    END IF;
        -- Obtient la valeur de enc_chart à partir de la table DSID pour DSID_DSNM
        SELECT DSID_DSNM INTO enc_chart_value FROM pointsdsid LIMIT 1;
        -- Obtient la valeur de scale à partir de la table DSID pour DSPM_CSCL
        SELECT DSPM_CSCL INTO scale_value FROM pointsdsid LIMIT 1;
        -- Obtient la valeur de purpose à partir de la table DSID pour DSID_INTU
        SELECT DSID_INTU INTO purpose_value FROM pointsdsid LIMIT 1;

        -- Met à jour les enregistrements avec les valeurs trouvées dans la table DSID
    EXECUTE format('UPDATE pointsenc.%I SET enc_chart = $1 WHERE enc_chart IS NULL', table_record.table_name) USING enc_chart_value;
    EXECUTE format('UPDATE pointsenc.%I SET scale = $1 WHERE scale IS NULL', table_record.table_name) USING scale_value;
    EXECUTE format('UPDATE pointsenc.%I SET purpose = $1 WHERE purpose IS NULL', table_record.table_name) USING purpose_value;

END LOOP;

-- Efface l'enregistrement de la table DSID
DELETE FROM pointsenc.pointsdsid;

RETURN NULL;

END;
$$
LANGUAGE plpgsql;