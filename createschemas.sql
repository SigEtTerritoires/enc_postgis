CREATE SCHEMA IF NOT EXISTS enc
    AUTHORIZATION pg_database_owner;
GRANT ALL ON SCHEMA ENC TO pg_database_owner;
CREATE SCHEMA IF NOT EXISTS pointsenc
    AUTHORIZATION pg_database_owner;
GRANT ALL ON SCHEMA pointsenc TO pg_database_owner;
CREATE SCHEMA IF NOT EXISTS linesenc
    AUTHORIZATION pg_database_owner;
GRANT ALL ON SCHEMA linesenc TO pg_database_owner;
CREATE SCHEMA IF NOT EXISTS polysenc
    AUTHORIZATION pg_database_owner;
GRANT ALL ON SCHEMA polysenc TO pg_database_owner;
