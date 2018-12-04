-- This script installs all the objects described in the recruitment task.

SET FEEDBACK OFF
CREATE PROCEDURE PRINT(msg IN VARCHAR) AS
BEGIN
    DBMS_OUTPUT.PUT_LINE(msg);
END;
/
SET SERVEROUTPUT ON
SPOOL install_log.txt

EXEC PRINT('Creating DOCUMENTS table and triggers...');
SET FEEDBACK ON

@@scripts/1_DOCUMENTS_table.sql

SET FEEDBACK OFF
EXEC PRINT('Inserting sample data into DOCUMENTS table...');
SET FEEDBACK ON

@@scripts/2_DOCUMENTS_data.sql

SET FEEDBACK OFF
EXEC PRINT('Creating PKG_DOCUMENTS package...');
SET FEEDBACK ON

@@scripts/3_PKG_DOCUMENTS.sql

SET FEEDBACK OFF
EXEC PRINT('Data is prepared. You can now run the 2_Demo.sql script.');
SET FEEDBACK ON

SPOOL OFF
SET FEEDBACK OFF
DROP PROCEDURE PRINT;
