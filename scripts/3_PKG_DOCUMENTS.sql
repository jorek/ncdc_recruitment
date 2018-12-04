CREATE OR REPLACE PACKAGE PKG_DOCUMENTS AS
   SUBTYPE pesel_number IS NUMBER (11,0) NOT NULL;
   FUNCTION validate_pesel (pesel pesel_number) RETURN BOOLEAN;
   PROCEDURE print_documents;
END PKG_DOCUMENTS;
/

CREATE OR REPLACE PACKAGE BODY PKG_DOCUMENTS AS
    
    FUNCTION validate_pesel (pesel pesel_number)
    RETURN BOOLEAN
    IS
        -- PESEL consists of 11 digits. Store all of them separately, the 11th being the control digit.
        digit_1 NUMBER  := FLOOR(pesel / POWER(10, 10) MOD 10);
        digit_2 NUMBER  := FLOOR(pesel / POWER(10, 09) MOD 10);
        digit_3 NUMBER  := FLOOR(pesel / POWER(10, 08) MOD 10);
        digit_4 NUMBER  := FLOOR(pesel / POWER(10, 07) MOD 10);
        digit_5 NUMBER  := FLOOR(pesel / POWER(10, 06) MOD 10);
        digit_6 NUMBER  := FLOOR(pesel / POWER(10, 05) MOD 10);
        digit_7 NUMBER  := FLOOR(pesel / POWER(10, 04) MOD 10);
        digit_8 NUMBER  := FLOOR(pesel / POWER(10, 03) MOD 10);
        digit_9 NUMBER  := FLOOR(pesel / POWER(10, 02) MOD 10);
        digit_10 NUMBER := FLOOR(pesel / POWER(10, 01) MOD 10);
        control_digit NUMBER := FLOOR(pesel MOD 10);
    BEGIN
        -- Take secondary formula from https://pl.wikipedia.org/wiki/PESEL:
        -- (1×a + 3×b + 7×c + 9×d + 1×e + 3×f + 7×g + 9×h + 1×i + 3×j + 1×k) mod 10 = 0
        -- where a...k are consecutive digits in the PESEL number.
        RETURN
        (
            1 * digit_1
            + 3 * digit_2
            + 7 * digit_3
            + 9 * digit_4
            + 1 * digit_5
            + 3 * digit_6
            + 7 * digit_7
            + 9 * digit_8
            + 1 * digit_9
            + 3 * digit_10
            + 1 * control_digit
        ) mod 10 = 0;
    END validate_pesel;

    PROCEDURE print_documents IS
        document_description CLOB;
        CURSOR c_document_descriptions IS
            SELECT "Document Description"
            FROM DOCUMENTS
            ORDER BY "Document Id";
    BEGIN
        OPEN c_document_descriptions;
        LOOP
            FETCH c_document_descriptions INTO document_description;
            EXIT WHEN c_document_descriptions%notfound;
            IF document_description IS NULL OR document_description = EMPTY_CLOB()
            THEN
                DBMS_OUTPUT.PUT_LINE('No Description');
            ELSE
                DBMS_OUTPUT.PUT_LINE(document_description);
            END IF;
        END LOOP;
        CLOSE c_document_descriptions;
   END print_documents;
   
END PKG_DOCUMENTS;
/
