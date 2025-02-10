SELECT DISTINCT author_id AS id FROM Views
WHERE author_id IN(SELECT viewer_id FROM Views)
AND author_id = viewer_id
ORDER BY id;

SELECT DISTINCT table1.author_id AS id
FROM Views table1
JOIN Views table2
  ON table1.author_id = table2.viewer_id
WHERE table1.author_id = table1.viewer_id
ORDER BY id;