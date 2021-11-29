-- if your $DATA_PATH_HOST/mysql is exists and you do not want to delete it, you can run by manual execution:
-- mysql -u root -p < /docker-entrypoint-initdb.d/createdb.sql
-- docker-compose exec postgres bash

CREATE TABLE note
(
	id INT PRIMARY KEY UNIQUE,
	title VARCHAR(100) NOT NULL,
	content TEXT,
    watch_number INT
);

COMMENT ON COLUMN note.id IS 'Entity ID';
COMMENT ON COLUMN note.title IS 'Note Title';
COMMENT ON COLUMN note.content IS 'Note Content';

INSERT INTO note (id, title, content, watch_number) VALUES (1,'note 1', 'content 1', 0);
INSERT INTO note (id, title, content, watch_number) VALUES (2,'note 2', 'content 2', 7);
INSERT INTO note (id, title, content, watch_number) VALUES (3,'note 3', 'content 3', 1);
INSERT INTO note (id, title, content, watch_number) VALUES (4,'note 4', 'content 4', 5);
INSERT INTO note (id, title, content, watch_number) VALUES (5,'note 5', 'content 5', 0);

VACUUM(FULL) note;
