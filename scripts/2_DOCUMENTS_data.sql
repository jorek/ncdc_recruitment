INSERT INTO documents
(
    "Document Id",
    "Document Name",
    "Document Description"
)
SELECT
    1, 'Test 1', 'One' FROM DUAL UNION ALL
SELECT
    2, 'Test 2', 'Two' FROM DUAL UNION ALL
SELECT
    3, 'Test 3', 'Three' FROM DUAL UNION ALL
SELECT
    4, 'Test 4', 'Four' FROM DUAL UNION ALL
SELECT
    5, 'Test 5', null FROM DUAL UNION ALL
SELECT
    6, 'Test 6', 'Six' FROM DUAL;
