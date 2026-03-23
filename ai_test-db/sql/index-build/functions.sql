CREATE OR REPLACE FUNCTION get_user_by_id(user_id INT)
RETURNS TABLE(id INT, username TEXT, email TEXT) AS $$
BEGIN
    RETURN QUERY SELECT id, username, email FROM users WHERE id = user_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION create_user(new_username TEXT, new_email TEXT)
RETURNS VOID AS $$
BEGIN
    INSERT INTO users (username, email) VALUES (new_username, new_email);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_user_email(user_id INT, new_email TEXT)
RETURNS VOID AS $$
BEGIN
    UPDATE users SET email = new_email WHERE id = user_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_user(user_id INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM users WHERE id = user_id;
END;
$$ LANGUAGE plpgsql;