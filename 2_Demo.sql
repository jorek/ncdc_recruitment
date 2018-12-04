SET FEEDBACK OFF
CREATE PROCEDURE PRINT(msg IN VARCHAR) AS
BEGIN
    DBMS_OUTPUT.PUT_LINE(msg);
END;
/

EXEC PRINT('Sample DOCUMENTS data + generated fields follow:');
SELECT * FROM DOCUMENTS;

EXEC PRINT('Checking update trigger on DOCUMENTS table...');
UPDATE DOCUMENTS
SET "User Id" = 'Won''t work'
WHERE "Document Id" = 1;

EXEC PRINT('The "User Id" should be unchanged but the "Timestamp" should be changed:');
SELECT * FROM DOCUMENTS WHERE "Document Id" = 1;

EXEC PRINT('Printing DOCUMENTS'' descriptions through package''s method...');
EXEC PKG_DOCUMENTS.print_documents;

EXEC PRINT('Validating author''s PESEL number through package''s function...');
BEGIN
  DBMS_OUTPUT.PUT_LINE(
    CASE
        WHEN PKG_DOCUMENTS.validate_pesel(82121103116) THEN 'correct'
        ELSE 'incorrect'
    END);
  DBMS_OUTPUT.PUT_LINE(
    CASE
        WHEN PKG_DOCUMENTS.validate_pesel(82120103116) THEN 'correct'
        ELSE 'incorrect'
    END);
END;
/

DROP PROCEDURE PRINT;
