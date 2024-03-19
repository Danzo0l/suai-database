CREATE OR REPLACE PROCEDURE delete_passport_and_user(passport_number VARCHAR(20))
LANGUAGE plpgsql
AS $$
DECLARE
    user_id_to_delete INTEGER;
BEGIN
    -- Находим ID пользователя, связанного с указанным номером паспорта
    SELECT UserID INTO user_id_to_delete FROM Passports WHERE Number = passport_number;

    -- Удаляем запись из таблицы Passports по номеру паспорта
    DELETE FROM Passports WHERE Number = passport_number;

    -- Удаляем пользователя, если он был найден
    IF user_id_to_delete IS NOT NULL THEN
        DELETE FROM Users WHERE ID = user_id_to_delete;
    END IF;
END;
$$;

