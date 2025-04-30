--Q1--
CREATE TABLE `departments`(
  `department_id`INT unisigned NOT NULL PRIMARY KEY auto_increment,
  `name`VARCHAR(20) NOT NULL,
  `created_at`TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at`TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) 

--Q2--
ALTER TABLE people 
 ADD department_id INT unisigned AFTER email;

--Q3--
INSERT INTO departments (name)VALUES
  ('開発'),
  ('経理'),
  ('人事'),
  ('情報システム');
Query OK, 4 rows affected (0.005 sec)
Records: 4  Duplicates: 0  Warnings: 0

INSERT INTO reports (person_id,content)VALUES
  (38,'春はあけぼの左中間方向に飛んだ打球は'),
  (39,'ビーアンビシャス我が友よ冒険者よ'),
  (40,'ぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽぽ'),
  (41,'退場ですあなた退場です本当に退場です'),
  (42,'あなたすごいわねすごいわねすごおおい'),
  (43,'僕が生まれたこの島の空を僕はどれくらい知ってるんだろう'),
  (44,'ランチョンがあるのなら朝ごはんはモーチョンマットですね'),
  (45,'ゴールデンウィークはビーステップをやります'),
  (46,'ごんぎつねごんぎつねごんぎつねごんぎつね'),
  (47,'リユースリデュースリサイクルやったー');
Query OK, 10 rows affected (0.005 sec)
Records: 10  Duplicates: 0  Warnings: 0

--Q4--
 SELECT * FROM people;

UPDATE people SET department_id = 2 
WHERE person_id =2;

UPDATE people SET department_id = 2 
WHERE person_id =3;

UPDATE people SET department_id = 2 
WHERE person_id =4;

UPDATE people SET department_id = 2 
WHERE person_id =32;

UPDATE people SET department_id = 2 
WHERE person_id =33;

UPDATE people SET department_id = 2 
WHERE person_id =34;

UPDATE people SET department_id = 2 
WHERE person_id =35;

UPDATE people SET department_id = 2 
WHERE person_id =36;

UPDATE people SET department_id = 1 
WHERE person_id =37;

--Q5--
 SELECT name,age FROM people 
 WHERE gender = 1 ORDER BY age DESC;

--Q6--
SELECT
  `name`, `email`, `age`
  ---既存のテーブルから「名前」「メールアドレス」「年齢」の3つの項目だけを取得する---
FROM
  `people`
  ---「people」のテーブルを指定してレコードやカラムなどのデータを取り出す---
WHERE
  `department_id` = 1
  ---「department_id」が1である人だけのレコード(行)絞ってデータを取得する---
ORDER BY
  `created_at`;
  ---「created_at」というカラムの値を使って、作成日時の順に並べて表示させる---


--Q7--
SELECT * FROM people 
 WHERE (gender = 2 AND age BETWEEN 20 AND 29) 
 OR (gender = 1 AND age BETWEEN 40 AND 49);

--Q8--
SELECT * FROM people 
 WHERE department_id = 1 
 ORDER BY age ASC;

--Q9--
SELECT AVG(age) AS average_age 
 FROM people 
 WHERE gender = 2;

--Q10--
SELECT people.name,reports.content,departments.name 
 FROM people INNER JOIN reports 
 ON people.person_id = reports.person_id 
 INNER JOIN departments 
 ON departments.department_id = people.department_id;

--Q11--
 SELECT p.name, r.content 
  FROM people p LEFT OUTER JOIN reports r 
  USING (person_id) WHERE r.content IS NULL;