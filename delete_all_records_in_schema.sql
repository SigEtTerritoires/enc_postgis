-- FUNCTION: public.delete_all_records_in_schema(text)

-- DROP FUNCTION IF EXISTS public.delete_all_records_in_schema(text);

CREATE OR REPLACE FUNCTION public.delete_all_records_in_schema(
	schema_name text)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    table_record RECORD;
BEGIN
    -- Récupérer toutes les tables du schéma spécifié
    FOR table_record IN
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = schema_name AND table_type = 'BASE TABLE'
    LOOP
        -- Construction de la requête DELETE pour chaque table
        EXECUTE format('DELETE FROM %I.%I', schema_name, table_record.table_name);
    END LOOP;
END;
$BODY$;

ALTER FUNCTION public.delete_all_records_in_schema(text)
    OWNER TO postgres;
