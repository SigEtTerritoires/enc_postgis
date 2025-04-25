CREATE OR REPLACE TRIGGER check_update
    AFTER INSERT ON linesenc.linesdsid
    FOR EACH ROW
    EXECUTE PROCEDURE create_fields_and_update_values_linesenc();
	
CREATE OR REPLACE TRIGGER check_update
    AFTER INSERT ON polysenc.polysdsid
    FOR EACH ROW
    EXECUTE PROCEDURE create_fields_and_update_values_polysenc();
	
CREATE OR REPLACE TRIGGER check_update
    AFTER INSERT ON polysenc.polysdsid
    FOR EACH ROW
    EXECUTE PROCEDURE create_fields_and_update_values_polysenc();