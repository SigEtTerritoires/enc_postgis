CREATE OR REPLACE FUNCTION update_sbdare()
RETURNS VOID AS
$$
DECLARE
    rec_row RECORD;
    natsurt VARCHAR[4];
    natquat VARCHAR[4];
    S VARCHAR[3];
    flag INT := 0;
    etiq VARCHAR(25);
    etiquet VARCHAR(25);
BEGIN
  -- Vérifier si le champ 'Label' existe déjà
IF EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_schema = 'enc2' AND table_name = 'pt_sbdare' AND column_name = 'label'
    ) THEN
          

    -- Parcourir les lignes de la table enc.pt_sbdare
    FOR rec_row IN SELECT * FROM enc2.pt_sbdare WHERE label IS NULL LOOP
        -- Réinitialiser les variables à chaque itération de la boucle
        natsurt := ARRAY['','','',''];
        S := ARRAY[',',',',','];
        flag :=0;
        
        -- Extraire les parties de natsur
        FOR i IN 1..4 LOOP
            --sortie anticipée
            IF i=4 AND flag=1 THEN
                EXIT;
            END IF;
            
            -- Vérifier si rec_row.natsur[i] est NULL
            IF rec_row.natsur[i] IS NULL THEN
                IF flag=0 THEN
                    natsurt[i] := '0';
                ELSE
                    natsurt[i+1] := '0';
                END IF;
            -- Vérifier si rec_row.natsur[i] contient un '/'
            ELSIF strpos(rec_row.natsur[i], '/') = 0 THEN
                IF flag=0 THEN
                    natsurt[i] := rec_row.natsur[i];
                    IF rec_row.natqua[i] IS NOT NULL THEN
                        natquat[i] := rec_row.natqua[i];
                    ELSE
                        natquat[i] := '0';
                    END IF;
                ELSE
                    natsurt[i+1] := rec_row.natsur[i];
                    IF rec_row.natqua[i] IS NOT NULL THEN
                        natquat[i+1] := rec_row.natqua[i];
                    ELSE
                        natquat[i] := '0';
                    END IF;
                END IF;
                
            ELSE
                -- Extraire les parties avant et après le '/'
                IF i < 5 THEN
                    natsurt[i] := split_part(rec_row.natsur[i], '/', 1);
                    natsurt[i+1] := split_part(rec_row.natsur[i], '/', 2);
                    IF rec_row.natqua[i] IS NOT NULL THEN
                        natquat[i] := rec_row.natqua[i];
                    ELSE
                        natquat[i] := '0';
                    END IF;
                    S[i] := '/';
                    flag :=1; -- nous avons trouvé une valeur avec un '/'
                ELSE
                    natsurt[i] := split_part(rec_row.natsur[i], '/', 1);
                END IF;
            END IF;
        END LOOP;
        
        etiquet :='';
        etiq :='';
        
        FOR i IN 1..4 LOOP
            IF natsurt[i] <> '0' THEN
                -- Exécutez la requête SQL pour récupérer le label en fonction de natsurt[i] et natquat[i]
                EXECUTE 'SELECT etiq FROM enc2.natsurf WHERE NATSURT = $1 AND NATQUAT = $2' INTO etiq USING natsurt[i], natquat[i];
                
                IF i =1 THEN
                    etiquet := etiq ;
                ELSE
                    etiquet := etiquet || S[i-1] || etiq;
                END IF;
            END IF;
        END LOOP;
        
        -- Mettre à jour la ligne avec les valeurs extraites
        UPDATE enc2.pt_sbdare
        SET
            label = etiquet
        WHERE pt_sbdare.ogc_fid = rec_row.ogc_fid;
    END LOOP;
END IF;
END;
$$
LANGUAGE plpgsql;
