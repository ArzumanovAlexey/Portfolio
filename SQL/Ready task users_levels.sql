Задания на написание запросов к БД:								
1. Отобрать из таблицы user всех пользователей, у которых level_id=1, skill > 799000 и в имени встречается буква а								
2. Удалить всех пользователей, у которых skill меньше 100000								
3. Вывести все данные из таблицы user в порядке убывания по полю skill 								
4. Добавить в таблицу user нового пользователя по имени Oleg, с уровнем 4 и skill =10								
5. Обновить данные в таблице user -  для пользователей с level_id меньше 2 проставить skill 2000000								
6. Выбрать user_name всех пользователей уровня admin используя подзапрос								
7. Выбрать user_name всех пользователей уровня admin используя join
CREATE TABLE user_1 (
   id serial not null,
   user_name varchar(50) not null,
   level_id int,
   skill int,
   PRIMARY KEY (id)
   );
INSERT INTO user_1 (id, user_name, level_id, skill)
VALUES (default, 'Anton', 1, 90000), (default, 'Denis', 3, 4000), (default, 'Petr', 2, 50000), (default, 'Andrey', 4, 20), (default, 'OLga', 1, 600000), (default, 'Anna', 1, 1600000)

CREATE TABLE level (
   id serial not null,
   level_name varchar(50) not null,
   PRIMARY KEY (id)
   );

INSERT INTO level (id, level_name)
VALUES (default, 'admin'), (default, 'power_user'), (default, 'user'), (default, 'guest')

SELECT *FROM level;

SELECT * FROM user_1


SELECT user_name, id
FROM user_1
WHERE level_id IN (SELECT id
             FROM level
             WHERE level_name = 'admin');

SELECT user_1.user_name, level.level_name
FROM user_1
JOIN level ON user_1.level_id = level.id
WHERE level_name = 'admin';

