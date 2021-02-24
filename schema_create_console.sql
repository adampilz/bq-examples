SELECT
    TO_JSON_STRING(
        ARRAY_AGG(STRUCT(
            IF(is_nullable = 'YES', 'NULLABLE', 'REQUIRED') AS mode,
            column_name AS name,
            data_type AS type)
    ORDER BY ordinal_position), TRUE) AS myschema

FROM
    wsj.INFORMATION_SCHEMA.COLUMNS # change data set name

WHERE
    table_name = 't1' # change table name
