    -- Создание таблицы "Книги" (Books)
    CREATE TABLE Books (
        book_id SERIAL PRIMARY KEY,
        title VARCHAR(255) NOT NULL,
        author VARCHAR(255),
        genre VARCHAR(100),
        isbn VARCHAR(20) UNIQUE
    );

    -- Создание таблицы "Читатели" (Readers)
    CREATE TABLE Readers (
        reader_id SERIAL PRIMARY KEY,
        first_name VARCHAR(100) NOT NULL,
        last_name VARCHAR(100) NOT NULL,
          phone_number VARCHAR(20),
        email VARCHAR(255)
    );

    -- Создание таблицы "Выдача" (Loans)
    CREATE TABLE Loans (
        loan_id SERIAL PRIMARY KEY,
        book_id INT NOT NULL,
        reader_id INT NOT NULL,
        loan_date DATE NOT NULL,
        return_date DATE,
        FOREIGN KEY (book_id) REFERENCES Books(book_id),
        FOREIGN KEY (reader_id) REFERENCES Readers(reader_id)
    );

    -- Заполнение таблиц тестовыми данными

    -- Заполнение таблицы Books
    INSERT INTO Books (title, author, genre, isbn) VALUES
    ('Мастер и Маргарита', 'Михаил Булгаков', 'Роман', '978-5-9696-0088-1'),
    ('1984', 'Джордж Оруэлл', 'Антиутопия', '978-5-17-152391-9'),
    ('Гарри Поттер и философский камень', 'Джоан Роулинг', 'Фэнтези', '978-5-353-05702-1'),
    ('Унесенные ветром', 'Маргарет Митчелл', 'Роман', '978-5-17-142115-4'),
    ('Преступление и наказание', 'Федор Достоевский', 'Роман', '978-5-17-152621-7');

    -- Заполнение таблицы Readers
    INSERT INTO Readers (first_name, last_name, phone_number, email) VALUES
    ('Иван', 'Иванов', '+79001234567', 'ivan@example.com'),
    ('Петр', 'Петров', '+79107654321', 'petr@example.com'),
    ('Анна', 'Сидорова', '+79203332211', 'anna@example.com'),
    ('Мария', 'Кузнецова', '+79304445566', 'maria@example.com'),
    ('Алексей', 'Смирнов', '+79405557788', 'alexey@example.com');

    -- Заполнение таблицы Loans
    INSERT INTO Loans (book_id, reader_id, loan_date, return_date) VALUES
    (1, 1, '2023-10-26', '2023-11-15'),
    (2, 2, '2023-11-01', NULL),
    (3, 3, '2023-10-27', '2023-11-05'),
    (4, 4, '2023-11-05', NULL),
    (5, 5, '2023-11-06', '2023-11-10');
