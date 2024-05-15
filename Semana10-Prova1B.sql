-- ANA JULIA FERREIRA GARCIA
-- 09/04/2024

SELECT "ANA JULIA FERREIRA GARCIA";
select sleep(5);

-- Prova1B
use Prova1B;

--  1. Crie a tabela Categorias e insira os dados.
select "Questao 1.1";
CREATE TABLE IF NOT EXISTS Categorias(
	id INT NOT NULL,
	categoria VARCHAR(30));
	
INSERT INTO Categorias VALUES(10, 'papelaria');
INSERT INTO Categorias VALUES(11, 'informatica');
INSERT INTO Categorias VALUES(12, 'oficina');
INSERT INTO Categorias VALUES(13, 'moveis');
select sleep(5);


--  2. Faça uma consulta que liste o id do produto, a quantidade e o preço-base de cada produto
select "Questao 1.2";
SELECT E.id_produto, E.quantidade, F.preco_base FROM estoque E INNER JOIN financeiro F ON E.id_produto = F.produto;
select sleep(5);


--  3. 
select "Questao 1.3";
SELECT P.nome, E.quantidade, F.preco_base FROM estoque E INNER JOIN financeiro F INNER JOIN produtos P ON E.id_produto=F.produto AND P.id=E.id_produto;

select sleep(5);


--  4. 
select "Questao 1.4";
SELECT C.categoria, P.nome, E.quantidade, F.preco_base, (E.quantidade*F.preco_base) FROM estoque E INNER JOIN financeiro F INNER JOIN produtos P INNER JOIN categorias C ON E.id_produto=F.produto AND P.id=E.id_produto AND P.categoria=C.id;
select sleep(5);

--  5. 
select "Questao 1.5";
SELECT P.categoria, SUM(E.quantidade) AS total_categoria, SUM(F.preco_base) AS valor_total_categoria FROM estoque E INNER JOIN produtos P ON E.id_produto=P.id INNER JOIN financeiro F ON P.id=F.produto GROUP BY P.categoria; 
select sleep(5);

--  6. 
select "Questao 1.6";
SELECT P.categoria, P.nome, E.quantidade, (F.preco_base-F.preco_base/100*5) AS janeiro, (F.preco_base+F.preco_base/100*10) AS fevereiro FROM estoque E INNER JOIN financeiro F INNER JOIN produtos P ON E.id_produto=F.produto AND P.id=E.id_produto;    
select sleep(5);

--  7. 
select "Questao 1.7";
SELECT P.categoria, P.nome, E.quantidade, (F.preco_base-F.preco_base/100*5) AS janeiro, (F.preco_base+F.preco_base/100*10) AS fevereiro FROM estoque E INNER JOIN financeiro F INNER JOIN produtos P ON E.id_produto=F.produto AND P.id=E.id_produto WHERE P.categoria LIKE '10' OR P.categoria LIKE '11'; 
select sleep(5);

--  8. 
select "Questao 1.8";
SELECT categoria, total_categoria, valor_total_categoria_janeiro, valor_total_categoria_fevereiro FROM (SELECT P.categoria, SUM(E.quantidade) AS total_categoria, SUM(F.preco_base-F.preco_base/100*5) AS valor_total_categoria_janeiro, SUM(F.preco_base+F.preco_base/100*10) AS valor_total_categoria_fevereiro FROM estoque E INNER JOIN produtos P ON E.id_produto=P.id INNER JOIN financeiro F ON P.id=F.produto GROUP BY P.categoria) AS consulta WHERE valor_total_categoria_janeiro>100; 
select sleep(5);

-- Company
use company;

--  9. 
select "Questao 2.1";
SELECT D.DEPARTMENT_NAME, count(E.EMPLOYEE_ID) FROM departments D INNER JOIN employees E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID GROUP BY E.DEPARTMENT_ID ORDER BY count(E.EMPLOYEE_ID) DESC;
select sleep(5);


--  10. 
select "Questao 2.2";
SELECT JOB_TITLE, MAX_SALARY, MIN_SALARY, (MAX_SALARY-MIN_SALARY) AS DIFERENCA FROM jobs ORDER BY DIFERENCA DESC;
select sleep(5);


--  11. 
select "Questao 2.3";
SELECT D.DEPARTMENT_NAME, C.COUNTRY_NAME, R.REGION_NAME FROM departments D INNER JOIN locations L ON D.LOCATION_ID=L.LOCATION_ID INNER JOIN countries C ON L.COUNTRY_ID=C.COUNTRY_ID INNER JOIN regions R ON R.REGION_ID=C.REGION_ID;
select sleep(5);


--  12. 
select "Questao 2.4";
SELECT R.REGION_NAME, COUNT(C.COUNTRY_ID) AS NUM_PAISES FROM regions R INNER JOIN countries C ON R.REGION_ID=C.REGION_ID GROUP BY C.REGION_ID;
select sleep(5);
