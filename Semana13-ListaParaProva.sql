-- ANA JULIA FERREIRA GARCIA
-- 21/05/2024

SELECT "ANA JULIA FERREIRA GARCIA";
select sleep(5);

-- Banco de Dados usado
use Empresa;

--  1.
select "Questao 1.1";
SELECT S.Nome FROM Staff S INNER JOIN Vendas V ON S.idStaff=V.idVendedor WHERE V.DataVenda LIKE '%22';
select sleep(5);

--  2.
select "Questao 1.2";
SELECT S.Nome, COUNT(V.idVendedor) AS Vendas FROM Staff S INNER JOIN Vendas V ON S.idStaff=V.idVendedor WHERE V.DataVenda LIKE '%24' GROUP BY S.Nome;
select sleep(5);

--  3. 
select "Questao 1.3";
INSERT INTO Vendas (idVendas, idVendedor, DataVenda, ValorVenda) VALUES 
    (1, 1, "1/1/1", 1), 
    (2, 2, "2/2/2", 2),
    (3, 3, "3/3/3", 3);
select sleep(5);

--  4. 
select "Questao 1.4";
SELECT Nome FROM Produtos WHERE ValorUnitario > 1000;
select sleep(5);

-- Banco de Dados usado
use DadosPaises;

--  5. 
select "Questao 1.5";
SELECT Region FROM `Country`;
select sleep(5);

--  6. 
select "Questao 1.6";
SELECT Name, LifeExpectancy, Capital FROM `Country`;
select sleep(5);

--  7. 
select "Questao 1.7";
(SELECT Name, Region FROM Country WHERE GNP = (SELECT MAX(GNP) FROM Country)) UNION (SELECT Name, Region FROM Country WHERE GNP = (SELECT MIN(GNP) FROM Country));
select sleep(5);

--  8. 
select "Questao 1.8";
SELECT Region FROM Country WHERE Continent LIKE 'Africa';
select sleep(5);

--  9. 
select "Questao 1.9";
SELECT C.Name, C.Population, S.gdp FROM Country C INNER JOIN countries c ON C.Code2 = c.country_code2 INNER JOIN country_stats S ON S.country_id = c.country_id WHERE S.year LIKE '2000' ORDER BY S.gdp LIMIT 10;
select sleep(5);

-- Banco de Dados usado
use a2023951555@teiacoltec.org;

--  9. 
select "Questao 2.1";
SELECT B.Nome FROM biblioteca B INNER JOIN alugadobiblioteca A ON A.idLivro=B.idLivro WHERE A.Alugado = 1;
select sleep(5);

--  10. 
select "Questao 2.2";
SELECT idLivro FROM alugadobiblioteca WHERE quantidade = (SELECT MAX(quantidade) FROM alugadobiblioteca WHERE Alugado = 1);
select sleep(5);

--  11. 
select "Questao 2.3";
SELECT B.Nome, A.Usuario FROM biblioteca B INNER JOIN alugadoBiblioteca A ON B.idLivro=A.idLivro WHERE A.Alugado = 1;
select sleep(5);

--  12. 
select "Questao 2.4";
SELECT COUNT(idLivro) AS LivroAlugados FROM alugadoBiblioteca WHERE Alugado = 1;
select sleep(5);

--  13. 
select "Questao 2.5";
SELECT B.Nome AS LivroMaisCaro FROM biblioteca B INNER JOIN financeiroBiblioteca F ON B.idLivro=F.idLivro WHERE F.preco = (SELECT MAX(preco) FROM financeiroBiblioteca);
select sleep(5);
