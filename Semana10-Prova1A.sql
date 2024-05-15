-- ANA JULIA FERREIRA GARCIA
-- 22/04/2024

SELECT "ANA JULIA FERREIRA GARCIA";
select sleep(5);

-- Prova1A
use Prova1A;

--  1.
select "Questao 1.1";
CREATE TABLE IF NOT EXISTS departamento(
	id INT NOT NULL,
	departamento VARCHAR(30))
    gerente INT;
	
INSERT INTO departamento VALUES(101, 'RH', 5);
INSERT INTO departamento VALUES(102, 'TI', 6);
INSERT INTO departamento VALUES(103, 'Marketing', 2);
INSERT INTO departamento VALUES(104, 'Vendas', 4);
select sleep(5);


--  2.
select "Questao 1.2";
SELECT E.nome, D.departamento, F.salario_base FROM empregados E INNER JOIN departamentos D ON E.dept_id=D.id INNER JOIN financeiro F ON E.id=F.funcionario ORDER BY D.departamento ASC; 
select sleep(5);


--  3. 
select "Questao 1.3";
SELECT D.departamento, SUM(F.salario_base) AS salario_base_total FROM empregados E INNER JOIN departamentos D ON E.dept_id=D.id INNER JOIN financeiro F ON E.id=F.funcionario GROUP BY D.departamento; 
select sleep(5);


--  4. 
select "Questao 1.4";
SELECT nome, salario_base, janeiro, fevereiro, março, (janeiro+fevereiro+março) AS total_trimestre FROM (SELECT E.nome, F.salario_base, (F.salario_base+F.salario_base/100*20) AS janeiro, (F.salario_base+F.salario_base/100*5) AS fevereiro, (F.salario_base+F.salario_base/100*25) AS março FROM empregados E INNER JOIN financeiro F ON E.id=F.funcionario) AS consulta;
select sleep(5);

--  5. 
select "Questao 1.5";
SELECT nome, salario_base, janeiro, fevereiro, março, (janeiro+fevereiro+março) AS total_trimestre FROM (SELECT E.nome, F.salario_base, (F.salario_base+F.salario_base/100*20) AS janeiro, (F.salario_base+F.salario_base/100*5) AS fevereiro, (F.salario_base+F.salario_base/100*25) AS março FROM empregados E INNER JOIN financeiro F ON E.id=F.funcionario INNER JOIN departamentos D ON E.id=D.gerente) AS consulta;  
select sleep(5);

--  6. 
select "Questao 1.6";
SELECT MAX(janeiro+fevereiro+março) AS Maximo FROM (SELECT (F.salario_base+F.salario_base/100*20) AS janeiro, (F.salario_base+F.salario_base/100*5) AS fevereiro, (F.salario_base+F.salario_base/100*25) AS março FROM empregados E INNER JOIN financeiro F ON E.id=F.funcionario) AS consulta; 
select sleep(5);

--  7. 
select "Questao 1.7";
SELECT MAX(janeiro+fevereiro+março) AS Maximo FROM (SELECT (F.salario_base+F.salario_base/100*20) AS janeiro, (F.salario_base+F.salario_base/100*5) AS fevereiro, (F.salario_base+F.salario_base/100*25) AS março FROM empregados E INNER JOIN financeiro F ON E.id=F.funcionario INNER JOIN departamentos D ON E.id=D.gerente) AS consulta;      
select sleep(5);

--  8. 
select "Questao 1.8";
SELECT D.departamento, SUM(F.salario_base) AS salario_base_total FROM empregados E INNER JOIN departamentos D ON E.dept_id=D.id INNER JOIN financeiro F ON E.id=F.funcionario GROUP BY D.departamento; 
select sleep(5);

-- EmpresaC
use EmpresaC;

--  9. 
select "Questao 2.1";
SELECT model, speed, hd FROM PC WHERE price<600 AND cd LIKE '12x' OR cd LIKE '24x';   
select sleep(5);


--  10. 
select "Questao 2.2";
SELECT P.model, P.price FROM PC P INNER JOIN Product p ON P.model=p.model  WHERE p.maker LIKE 'B' UNION SELECT L.model, L.price FROM Laptop L INNER JOIN Product p ON L.model=p.model WHERE p.maker LIKE 'B'; 
select sleep(5);


--  11. 
select "Questao 2.3";
(SELECT maker FROM Product WHERE type="PC") EXCEPT (SELECT maker FROM Product WHERE type="Laptop"); 
select sleep(5);


--  12. 
select "Questao 2.4";
SELECT model, price FROM Printer WHERE price=(SELECT MAX(price) FROM Printer);       
select sleep(5);
