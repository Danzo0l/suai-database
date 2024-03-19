CREATE OR REPLACE PROCEDURE create_user_with_passport_and_category(
    IN p_firstname VARCHAR(50),
    IN p_lastname VARCHAR(50),
    IN p_surname VARCHAR(50),
    IN p_telephone VARCHAR(20),
    IN p_birthday DATE,
    IN p_passport_number VARCHAR(20),
    IN p_passport_date_of_issue DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_user_id INTEGER;
BEGIN
    -- Создаем нового пользователя
    INSERT INTO Users (Firstname, Lastname, Surname, Telephone, Birthday, CategoryID)
    VALUES (p_firstname, p_lastname, p_surname, p_telephone, p_birthday, 1)
    RETURNING ID INTO v_user_id;

    -- Проверяем, есть ли уже запись о паспорте с таким номером
    IF NOT EXISTS (SELECT 1 FROM Passports WHERE Number = p_passport_number) THEN
        -- Если нет, создаем новую запись о паспорте для этого пользователя
        INSERT INTO Passports (Number, DateOfIssue, UserID)
        VALUES (p_passport_number, p_passport_date_of_issue, v_user_id);
    END IF;
END;
$$;

