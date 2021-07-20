 DROP FUNCTION parent_references_func(bigint) ;
 CREATE OR REPLACE FUNCTION public.parent_references_func(IN block_id_in bigint)
    RETURNS TABLE(span_id bigint, block_id bigint) AS

$func$
BEGIN
	RETURN QUERY
	WITH RECURSIVE refs(span_id, block_id) AS (
			SELECT spans.id, spans.id
			FROM spans
			WHERE spans.id = block_id_in
		UNION ALL
			SELECT span_refs.source_span_id, refs.block_id
			FROM refs
			JOIN span_refs on refs.span_id = span_refs.child_span_id

	)
	TABLE refs;
END
$func$ LANGUAGE plpgsql;
