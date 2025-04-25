-- Création de la séquence pointsdsid_ogc_fid_seq
CREATE SEQUENCE IF NOT EXISTS pointsenc.pointsdsid_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
	-- Création de la séquence polysdsid_ogc_fid_seq
CREATE SEQUENCE IF NOT EXISTS polysenc.polysdsid_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
		-- Création de la séquence linesdsid_ogc_fid_seq
CREATE SEQUENCE IF NOT EXISTS linesenc.linesdsid_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
-- Table: pointsenc.pointsdsid

-- DROP TABLE IF EXISTS pointsenc.pointsdsid;

CREATE TABLE IF NOT EXISTS pointsenc.pointsdsid
(
    ogc_fid integer NOT NULL DEFAULT nextval('pointsenc.pointsdsid_ogc_fid_seq'::regclass),
    dsid_expp numeric(3,0),
    dsid_intu numeric(3,0),
    dsid_dsnm character varying COLLATE pg_catalog."default",
    dsid_edtn character varying COLLATE pg_catalog."default",
    dsid_updn character varying COLLATE pg_catalog."default",
    dsid_uadt character varying(8) COLLATE pg_catalog."default",
    dsid_isdt character varying(8) COLLATE pg_catalog."default",
    dsid_sted numeric(11,6),
    dsid_prsp numeric(3,0),
    dsid_psdn character varying COLLATE pg_catalog."default",
    dsid_pred character varying COLLATE pg_catalog."default",
    dsid_prof numeric(3,0),
    dsid_agen numeric(5,0),
    dsid_comt character varying COLLATE pg_catalog."default",
    dssi_dstr numeric(3,0),
    dssi_aall numeric(3,0),
    dssi_nall numeric(3,0),
    dssi_nomr numeric(10,0),
    dssi_nocr numeric(10,0),
    dssi_nogr numeric(10,0),
    dssi_nolr numeric(10,0),
    dssi_noin numeric(10,0),
    dssi_nocn numeric(10,0),
    dssi_noed numeric(10,0),
    dssi_nofa numeric(10,0),
    dspm_hdat numeric(3,0),
    dspm_vdat numeric(3,0),
    dspm_sdat numeric(3,0),
    dspm_cscl numeric(10,0),
    dspm_duni numeric(3,0),
    dspm_huni numeric(3,0),
    dspm_puni numeric(3,0),
    dspm_coun numeric(3,0),
    dspm_comf numeric(10,0),
    dspm_somf numeric(10,0),
    dspm_comt character varying COLLATE pg_catalog."default",
    CONSTRAINT pointsdsid_pkey PRIMARY KEY (ogc_fid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS pointsenc.pointsdsid
    OWNER to postgres;	
	-- Table: polysenc.polysdsid

-- DROP TABLE IF EXISTS polysenc.polysdsid;

CREATE TABLE IF NOT EXISTS polysenc.polysdsid
(
    ogc_fid integer NOT NULL DEFAULT nextval('polysenc.polysdsid_ogc_fid_seq'::regclass),
    dsid_expp numeric(3,0),
    dsid_intu numeric(3,0),
    dsid_dsnm character varying COLLATE pg_catalog."default",
    dsid_edtn character varying COLLATE pg_catalog."default",
    dsid_updn character varying COLLATE pg_catalog."default",
    dsid_uadt character varying(8) COLLATE pg_catalog."default",
    dsid_isdt character varying(8) COLLATE pg_catalog."default",
    dsid_sted numeric(11,6),
    dsid_prsp numeric(3,0),
    dsid_psdn character varying COLLATE pg_catalog."default",
    dsid_pred character varying COLLATE pg_catalog."default",
    dsid_prof numeric(3,0),
    dsid_agen numeric(5,0),
    dsid_comt character varying COLLATE pg_catalog."default",
    dssi_dstr numeric(3,0),
    dssi_aall numeric(3,0),
    dssi_nall numeric(3,0),
    dssi_nomr numeric(10,0),
    dssi_nocr numeric(10,0),
    dssi_nogr numeric(10,0),
    dssi_nolr numeric(10,0),
    dssi_noin numeric(10,0),
    dssi_nocn numeric(10,0),
    dssi_noed numeric(10,0),
    dssi_nofa numeric(10,0),
    dspm_hdat numeric(3,0),
    dspm_vdat numeric(3,0),
    dspm_sdat numeric(3,0),
    dspm_cscl numeric(10,0),
    dspm_duni numeric(3,0),
    dspm_huni numeric(3,0),
    dspm_puni numeric(3,0),
    dspm_coun numeric(3,0),
    dspm_comf numeric(10,0),
    dspm_somf numeric(10,0),
    dspm_comt character varying COLLATE pg_catalog."default",
    CONSTRAINT polysdsid_pkey PRIMARY KEY (ogc_fid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS polysenc.polysdsid
    OWNER to postgres;
	-- Table: linesenc.linesdsid

-- DROP TABLE IF EXISTS linesenc.linesdsid;

CREATE TABLE IF NOT EXISTS linesenc.linesdsid
(
    ogc_fid integer NOT NULL DEFAULT nextval('linesenc.linesdsid_ogc_fid_seq'::regclass),
    dsid_expp numeric(3,0),
    dsid_intu numeric(3,0),
    dsid_dsnm character varying COLLATE pg_catalog."default",
    dsid_edtn character varying COLLATE pg_catalog."default",
    dsid_updn character varying COLLATE pg_catalog."default",
    dsid_uadt character varying(8) COLLATE pg_catalog."default",
    dsid_isdt character varying(8) COLLATE pg_catalog."default",
    dsid_sted numeric(11,6),
    dsid_prsp numeric(3,0),
    dsid_psdn character varying COLLATE pg_catalog."default",
    dsid_pred character varying COLLATE pg_catalog."default",
    dsid_prof numeric(3,0),
    dsid_agen numeric(5,0),
    dsid_comt character varying COLLATE pg_catalog."default",
    dssi_dstr numeric(3,0),
    dssi_aall numeric(3,0),
    dssi_nall numeric(3,0),
    dssi_nomr numeric(10,0),
    dssi_nocr numeric(10,0),
    dssi_nogr numeric(10,0),
    dssi_nolr numeric(10,0),
    dssi_noin numeric(10,0),
    dssi_nocn numeric(10,0),
    dssi_noed numeric(10,0),
    dssi_nofa numeric(10,0),
    dspm_hdat numeric(3,0),
    dspm_vdat numeric(3,0),
    dspm_sdat numeric(3,0),
    dspm_cscl numeric(10,0),
    dspm_duni numeric(3,0),
    dspm_huni numeric(3,0),
    dspm_puni numeric(3,0),
    dspm_coun numeric(3,0),
    dspm_comf numeric(10,0),
    dspm_somf numeric(10,0),
    dspm_comt character varying COLLATE pg_catalog."default",
    CONSTRAINT linesdsid_pkey PRIMARY KEY (ogc_fid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS linesenc.linesdsid
    OWNER to postgres;
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
CREATE OR REPLACE FUNCTION create_fields_and_update_values_linesenc()
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
	FOR table_record IN SELECT table_name FROM information_schema.tables WHERE table_schema = 'linesenc' AND table_name != 'linesdsid' LOOP
	-- Composer une requête dynamique pour vérifier si la table est vide
		EXECUTE format('SELECT COUNT(*) FROM linesenc.%I', table_record.table_name) INTO empty_tables;

    -- Si le nombre de lignes est égal à zéro, supprimer la table
		IF empty_tables = 0 THEN
			EXECUTE format('DROP TABLE IF EXISTS linesenc.%I CASCADE',  table_record.table_name);
			RAISE NOTICE 'Table linesenc.%I supprimée car elle est vide.',  table_record.table_name;
		END IF;
	END LOOP;
	
	-- Parcours de toutes les tables du schéma linesenc 
    FOR table_record IN SELECT table_name FROM information_schema.tables WHERE table_schema = 'linesenc' AND table_name != 'linesdsid' LOOP
        -- Vérifie si les champs enc_chart et scale n'existent pas dans la table actuelle
        IF NOT EXISTS (
            SELECT column_name FROM information_schema.columns
            WHERE table_schema = 'linesenc' AND table_name = table_record.table_name AND column_name IN ('enc_chart', 'scale','purpose')
        ) THEN
            -- Crée le champ enc_chart de type texte
            EXECUTE format('ALTER TABLE linesenc.%I ADD COLUMN enc_chart TEXT', table_record.table_name);
            -- Crée le champ scale de type numérique
            EXECUTE format('ALTER TABLE linesenc.%I ADD COLUMN scale NUMERIC', table_record.table_name);
			-- Crée le champ purpose de type numérique
            EXECUTE format('ALTER TABLE linesenc.%I ADD COLUMN purpose NUMERIC', table_record.table_name);
					IF NOT EXISTS (
					SELECT column_name FROM information_schema.columns
					WHERE table_schema = 'linesenc' AND table_name = table_record.table_name AND column_name IN ('posacc','quapos')
					) THEN
					-- Crée le champ POSACC de type numérique
					EXECUTE format('ALTER TABLE linesenc.%I ADD COLUMN posacc NUMERIC(10,0)', table_record.table_name);
					-- Crée le champ QUAPOS de type numérique
					EXECUTE format('ALTER TABLE linesenc.%I ADD COLUMN quapos INTEGER', table_record.table_name);
				END IF;
            RAISE NOTICE 'Champs enc_chart, scale et purpose créés dans la table %', table_record.table_name;
			
        END IF;
            -- Obtient la valeur de enc_chart à partir de la table DSID pour DSID_DSNM
            SELECT DSID_DSNM INTO enc_chart_value FROM linesdsid LIMIT 1;
            -- Obtient la valeur de scale à partir de la table DSID pour DSPM_CSCL
            SELECT DSPM_CSCL INTO scale_value FROM linesdsid LIMIT 1;
			-- Obtient la valeur de purpose à partir de la table DSID pour DSID_INTU
            SELECT DSID_INTU INTO purpose_value FROM linesdsid LIMIT 1;
		
            -- Met à jour les enregistrements avec les valeurs trouvées dans la table DSID
        EXECUTE format('UPDATE linesenc.%I SET enc_chart = $1 WHERE enc_chart IS NULL', table_record.table_name) USING enc_chart_value;
        EXECUTE format('UPDATE linesenc.%I SET scale = $1 WHERE scale IS NULL', table_record.table_name) USING scale_value;
        EXECUTE format('UPDATE linesenc.%I SET purpose = $1 WHERE purpose IS NULL', table_record.table_name) USING purpose_value;
    END LOOP;

    -- Efface l'enregistrement de la table DSID
    DELETE FROM linesenc.linesdsid;
    
    RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION create_fields_and_update_values_polysenc()
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
	FOR table_record IN SELECT table_name FROM information_schema.tables WHERE table_schema = 'polysenc' AND table_name != 'polysdsid' LOOP
	-- Composer une requête dynamique pour vérifier si la table est vide
		EXECUTE format('SELECT COUNT(*) FROM polysenc.%I', table_record.table_name) INTO empty_tables;

    -- Si le nombre de lignes est égal à zéro, supprimer la table
		IF empty_tables = 0 THEN
			EXECUTE format('DROP TABLE IF EXISTS polysenc.%I CASCADE',  table_record.table_name);
			RAISE NOTICE 'Table polysenc.%I supprimée car elle est vide.',  table_record.table_name;
		END IF;
	END LOOP;
	
	-- Parcours de toutes les tables du schéma polysenc 
    FOR table_record IN SELECT table_name FROM information_schema.tables WHERE table_schema = 'polysenc' AND table_name != 'polysdsid' LOOP
        -- Vérifie si les champs enc_chart et scale n'existent pas dans la table actuelle
        IF NOT EXISTS (
            SELECT column_name FROM information_schema.columns
            WHERE table_schema = 'polysenc' AND table_name = table_record.table_name AND column_name IN ('enc_chart', 'scale','purpose')
        ) THEN
            -- Crée le champ enc_chart de type texte
            EXECUTE format('ALTER TABLE polysenc.%I ADD COLUMN enc_chart TEXT', table_record.table_name);
            -- Crée le champ scale de type numérique
            EXECUTE format('ALTER TABLE polysenc.%I ADD COLUMN scale NUMERIC', table_record.table_name);
			-- Crée le champ purpose de type numérique
            EXECUTE format('ALTER TABLE polysenc.%I ADD COLUMN purpose NUMERIC', table_record.table_name);
						IF NOT EXISTS (
					SELECT column_name FROM information_schema.columns
					WHERE table_schema = 'polysenc' AND table_name = table_record.table_name AND column_name IN ('posacc','quapos')
					) THEN
					-- Crée le champ POSACC de type numérique
					EXECUTE format('ALTER TABLE polysenc.%I ADD COLUMN POSACC NUMERIC(10,0)', table_record.table_name);
					-- Crée le champ QUAPOS de type numérique
					EXECUTE format('ALTER TABLE polysenc.%I ADD COLUMN QUAPOS INTEGER', table_record.table_name);
				END IF;
            RAISE NOTICE 'Champs enc_chart, scale et purpose créés dans la table %', table_record.table_name;
			
        END IF;
            -- Obtient la valeur de enc_chart à partir de la table DSID pour DSID_DSNM
            SELECT DSID_DSNM INTO enc_chart_value FROM polysenc.polysdsid LIMIT 1;
            -- Obtient la valeur de scale à partir de la table DSID pour DSPM_CSCL
            SELECT DSPM_CSCL INTO scale_value FROM polysenc.polysdsid LIMIT 1;
			-- Obtient la valeur de purpose à partir de la table DSID pour DSID_INTU
            SELECT DSID_INTU INTO purpose_value FROM polysenc.polysdsid LIMIT 1;
		
            -- Met à jour les enregistrements avec les valeurs trouvées dans la table DSID
        EXECUTE format('UPDATE polysenc.%I SET enc_chart = $1 WHERE enc_chart IS NULL', table_record.table_name) USING enc_chart_value;
        EXECUTE format('UPDATE polysenc.%I SET scale = $1 WHERE scale IS NULL', table_record.table_name) USING scale_value;
        EXECUTE format('UPDATE polysenc.%I SET purpose = $1 WHERE purpose IS NULL', table_record.table_name) USING purpose_value;
    END LOOP;

    -- Efface l'enregistrement de la table DSID
    DELETE FROM polysenc.polysdsid;
    
    RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER check_update
    AFTER INSERT ON linesenc.linesdsid
    FOR EACH ROW
    EXECUTE PROCEDURE create_fields_and_update_values_linesenc();
	
CREATE OR REPLACE TRIGGER check_update
    AFTER INSERT ON polysenc.polysdsid
    FOR EACH ROW
    EXECUTE PROCEDURE create_fields_and_update_values_polysenc();
	
CREATE OR REPLACE TRIGGER check_update
    AFTER INSERT ON pointsenc.pointsdsid
    FOR EACH ROW
    EXECUTE PROCEDURE create_fields_and_update_values_pointsenc();