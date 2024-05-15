-- ANA JULIA FERREIRA GARCIA
-- 23/04/2024
-- Exercícios com Operações em Conjunto

SELECT "ANA JULIA FERREIRA GARCIA";
select sleep(5);

SELECT ("Exemplo 4");
UPDATE notas N SET N.BancoDados = 6 WHERE N. id IN (SELECT P.ID FROM dadospessoais P WHERE P.nome LIKE 'Clyde');
select sleep(5);

SELECT ("Consultas Pedidas:");
SELECT ("Exercicio 5");

CREATE TEMPORARY TABLE maxNotas (
    Materia VARCHAR(20),
    ID int
);

INSERT INTO maxNotas (Materia, ID) VALUES 
    ('maxBDD', (SELECT id FROM notas ORDER BY BancoDados DESC LIMIT 1)),
    ('maxAEDES', (SELECT id FROM notas ORDER BY AEDES DESC LIMIT 1)),
    ('maxLabAEDES', (SELECT id FROM notas ORDER BY LabAEDES DESC LIMIT 1)),
    ('maxPOO', (SELECT id FROM notas ORDER BY POO DESC LIMIT 1));

SELECT * FROM maxNotas;

select sleep(5);


SELECT ("Exercicio 6");
CREATE TEMPORARY TABLE avgNotas (
    Materia VARCHAR(20),
    ID int
);

INSERT INTO avgNotas (Materia, ID) VALUES 
    ('avgBDD', (SELECT AVG(BancoDados) FROM notas)),
    ('avgAEDES', (SELECT AVG(AEDES) FROM notas)),
    ('avgLabAEDES', (SELECT AVG(LabAEDES) FROM notas)),
    ('avgPOO', (SELECT AVG(POO) FROM notas));

SELECT * FROM avgNotas;

select sleep(5);


SELECT ("Exercicio 7");
SELECT P.nome, ((N.BancoDados + N.AEDES + N.LabAEDES + N.POO)/4) AS Media FROM dadospessoais P INNER JOIN notas N ON P.id=N.id GROUP BY P.id;

select sleep(5);


SELECT ("Exercicio 8");
UPDATE notas SET media = ((BancoDados + AEDES + LabAEDES + POO)/4);

select sleep(5);


SELECT ("Exercicio 9");
UPDATE notas SET LabAEDES = 8 WHERE id = (SELECT id FROM dadospessoais WHERE nome LIKE 'Neil');

select sleep(5);


SELECT ("Exercicio 10");
UPDATE dadospessoais SET nome = 'Ana', sobrenome = "Logwach" WHERE sobrenome = "Logwatch";

select sleep(5);


SELECT ("Exercicio 11");
SELECT ("Feito no php");

select sleep(5);


-- Conjuntos
SELECT ("Exercicio 1 e 2");
SELECT ("Feito no php");

select sleep(5);


SELECT ("Exercicio 3");
SELECT * FROM a UNION ALL SELECT * FROM b UNION ALL SELECT * FROM c;

select sleep(5);


SELECT ("Exercicio 4");
SELECT * FROM a UNION SELECT * FROM b UNION SELECT * FROM c;

select sleep(5);


SELECT ("Exercicio 5");
SELECT * FROM a WHERE MOD(num, 2) NOT LIKE 0 UNION ALL SELECT * FROM b WHERE MOD(num, 2) NOT LIKE 0 UNION ALL SELECT * FROM c WHERE MOD(num, 2) NOT LIKE 0;

select sleep(5);


SELECT ("Exercicio 6");
SELECT SUM(num) AS soma FROM (SELECT * FROM a UNION ALL SELECT * FROM b UNION ALL SELECT * FROM c) AS total;

select sleep(5);


SELECT ("Exercicio 7");
CREATE TEMPORARY TABLE NUM (
    Tabela CHARACTER,
    Maior int, 
    Menor int
);

INSERT INTO NUM (Tabela, Maior, Menor) VALUES 
	('a', (SELECT MAX(num) FROM a), (SELECT MIN(num) FROM a)),
    ('b', (SELECT MAX(num) FROM b), (SELECT MIN(num) FROM b)),
    ('c', (SELECT MAX(num) FROM c), (SELECT MIN(num) FROM c));
   	
SELECT * FROM NUM;

select sleep(5);


SELECT ("Exercicio 8");
SELECT ("a)");
SELECT * FROM a UNION SELECT * FROM b UNION SELECT * FROM c;
SELECT ("b)");
SELECT A.num FROM a A INNER JOIN b B ON A.num = B.num INNER JOIN c C ON A.num = C.num ;
SELECT ("c)");
SELECT num FROM a
WHERE num 
NOT IN(SELECT num FROM b);
