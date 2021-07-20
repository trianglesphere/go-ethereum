 -- DROP FUNCTION tx_span_func(bigint) ;
 CREATE OR REPLACE FUNCTION public.tx_span_func(IN lookup_span_id bigint)
    RETURNS TABLE (span_id bigint) AS

$func$
BEGIN
	RETURN QUERY
	WITH RECURSIVE refs(span_id) AS (
			SELECT spans.id
			FROM spans
			WHERE spans.id = lookup_span_id
		UNION ALL
			SELECT span_refs.child_span_id
			FROM refs
			JOIN span_refs on refs.span_id = span_refs.source_span_id

	)
	SELECT refs.span_id
	FROM refs
	JOIN spans on refs.span_id = spans.id
	WHERE spans.operation_id = 19 ; -- apply_transaction
END
$func$ LANGUAGE plpgsql;
