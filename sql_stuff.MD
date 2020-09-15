# SQL Stuff

Query to review entities with highest count

    SELECT entity_id, COUNT(*) as count FROM states GROUP BY entity_id ORDER BY count DESC LIMIT 10;
    
