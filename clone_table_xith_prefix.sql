CREATE OR REPLACE FUNCTION clone_tables_with_prefix()
RETURNS void AS
$$
DECLARE
    table_nom text;
BEGIN
    -- Clonage des tables dans le schéma ENC et mise à jour des tables existantes
    
    -- Boucle sur les tables du schéma pointsENC
    FOR table_nom IN (SELECT table_name as table_nom FROM information_schema.tables WHERE table_schema = 'pointsenc' AND table_name NOT IN ('pointsdsid') )
    LOOP
        -- Construction de la requête dynamique pour créer ou mettre à jour la table dans ENC
        EXECUTE format('CREATE TABLE IF NOT EXISTS enc3.pt_%I AS SELECT * FROM pointsenc.%I', table_nom, table_nom);
        EXECUTE format('INSERT INTO enc3.pt_%I SELECT * FROM pointsenc.%I ON CONFLICT DO NOTHING', table_nom, table_nom);
		IF table_nom NOT IN ('pointsdsid','isolatednode','connectednode') THEN
			EXECUTE format('UPDATE enc3.pt_%I SET posacc = isolatednode.posacc,  quapos = isolatednode.quapos FROM pointsenc.IsolatedNode isolatednode WHERE enc3.pt_%I.NAME_RCID[1] = isolatednode.RCID   AND enc3.pt_%I.enc_chart = isolatednode.enc_chart;', table_nom, table_nom,table_nom);
		END IF;
		EXECUTE format('CREATE INDEX IF NOT EXISTS index_%I ON enc3.pt_%I USING gist (wkb_geometry)',table_nom,table_nom);

    END LOOP;
    
    -- Boucle sur les tables du schéma LinesENC
    FOR table_nom IN (SELECT table_name as table_nom FROM information_schema.tables WHERE table_schema = 'linesenc' AND table_name NOT IN ('linesdsid'))
    LOOP
        -- Construction de la requête dynamique pour créer ou mettre à jour la table dans ENC
        EXECUTE format('CREATE TABLE IF NOT EXISTS enc3.li_%I AS SELECT * FROM linesenc.%I', table_nom, table_nom);
        EXECUTE format('INSERT INTO enc3.li_%I SELECT * FROM linesenc.%I ON CONFLICT DO NOTHING', table_nom, table_nom);
		IF table_nom NOT IN ('edge') THEN
			EXECUTE format('UPDATE enc3.li_%I SET posacc = edge.posacc,  quapos = edge.quapos FROM linesenc.edge edge WHERE enc3.li_%I.NAME_RCID[1] = edge.RCID   AND enc3.li_%I.enc_chart = edge.enc_chart;', table_nom, table_nom,table_nom);
		END IF;
		EXECUTE format('CREATE INDEX IF NOT EXISTS index_%I ON enc3.li_%I USING gist (wkb_geometry)',table_nom,table_nom);
		
    END LOOP;
    
    -- Boucle sur les tables du schéma PolysENC
    FOR table_nom IN (SELECT table_name as table_nom FROM information_schema.tables WHERE table_schema = 'polysenc' AND table_name NOT IN ( 'polysdsid','m_qual','m_srel'))
    LOOP
        -- Construction de la requête dynamique pour créer ou mettre à jour la table dans ENC
        EXECUTE format('CREATE TABLE IF NOT EXISTS enc3.pl_%I AS SELECT * FROM polysenc.%I', table_nom, table_nom);
        EXECUTE format('INSERT INTO enc3.pl_%I SELECT * FROM polysenc.%I ON CONFLICT DO NOTHING', table_nom, table_nom);
		EXECUTE format('UPDATE enc3.pl_%I SET posacc = edge.posacc,  quapos = edge.quapos FROM linesenc.edge edge WHERE enc3.pl_%I.NAME_RCID[1] = edge.RCID   AND enc3.pl_%I.enc_chart = edge.enc_chart;', table_nom, table_nom,table_nom);
		EXECUTE format('CREATE INDEX IF NOT EXISTS index_%I ON enc3.pl_%I USING gist (wkb_geometry)',table_nom,table_nom);
		
    END LOOP;
	EXECUTE (SELECT delete_all_records_in_schema('pointsenc'));
	EXECUTE (SELECT delete_all_records_in_schema('linesenc'));
	EXECUTE (SELECT delete_all_records_in_schema('polysenc'));
	EXECUTE (SELECT update_sbdare());
END;
$$ LANGUAGE plpgsql;
