CREATE TABLE DOCUMENTS
(
    "Document Id" NUMBER PRIMARY KEY,
    "Document Name" NVARCHAR2(50) NOT NULL,
    "Document Description" CLOB NULL,
    "Record Timestamp" TIMESTAMP NOT NULL,
    "Timestamp" TIMESTAMP NOT NULL,
    "Record User Id" VARCHAR2(50) NOT NULL,
    "User Id" VARCHAR2(50) NOT NULL
);

CREATE TRIGGER TR_DOCUMENTS_BI BEFORE INSERT
ON DOCUMENTS FOR EACH ROW
BEGIN
    :NEW."Record Timestamp" := CURRENT_TIMESTAMP;
    :NEW."Timestamp" := :NEW."Record Timestamp";
    :NEW."Record User Id" := USER;
    :NEW."User Id" := :NEW."Record User Id";
END;
/

CREATE TRIGGER TR_DOCUMENTS_BU BEFORE UPDATE
ON DOCUMENTS FOR EACH ROW
BEGIN
    :NEW."Record Timestamp" := :OLD."Record Timestamp";
    :NEW."Timestamp" := CURRENT_TIMESTAMP;
    :NEW."Record User Id" := :OLD."Record User Id";
    :NEW."User Id" := USER;
END;
/
