-- Создание таблицы "Книги" (Books)
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    genre VARCHAR(100),
    isbn VARCHAR(20) UNIQUE,
    publisher_id INT,
    status_id INT
);

-- Создание таблицы "Читатели" (Readers)
CREATE TABLE Readers (
    reader_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(255)
);

-- Создание таблицы "Выдача" (Loans)
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    reader_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (reader_id) REFERENCES Readers(reader_id)
);

-- Создание таблицы "Издательства" (Publishers)
CREATE TABLE Publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    contact_phone VARCHAR(20)
);

-- Создание таблицы "Статус книги" (BookStatuses)
CREATE TABLE BookStatuses (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

-- Добавление внешних ключей в таблицу Books
ALTER TABLE Books
ADD FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id);

ALTER TABLE Books
ADD FOREIGN KEY (status_id) REFERENCES BookStatuses(status_id);


-- Заполнение таблиц тестовыми данными

-- Заполнение таблицы Books
INSERT INTO Books (title, author, genre, isbn, publisher_id, status_id) VALUES
('Мастер и Маргарита', 'Михаил Булгаков', 'Роман', '978-5-9696-0088-1', 1, 1),
('1984', 'Джордж Оруэлл', 'Антиутопия', '978-5-17-152391-9', 2, 1),
('Гарри Поттер и философский камень', 'Джоан Роулинг', 'Фэнтези', '978-5-353-05702-1', 3, 1),
('Унесенные ветром', 'Маргарет Митчелл', 'Роман', '978-5-17-142115-4', 1, 1),
('Преступление и наказание', 'Федор Достоевский', 'Роман', '978-5-17-152621-7', 2, 1);

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


-- Заполнение таблицы Publishers
INSERT INTO Publishers (publisher_name, address, contact_phone) VALUES
('Эксмо', 'Москва, ул. Ленина, 1', '+74951234567'),
('АСТ', 'Санкт-Петербург, ул. Невский проспект, 2', '+78129876543'),
('Росмэн', 'Казань, ул. Пушкина, 3', '+78431112233');

-- Заполнение таблицы BookStatuses
INSERT INTO BookStatuses (status_name) VALUES
('Доступна'),
('Выдана'),
('Списана');
