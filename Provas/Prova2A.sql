-- ANA JULIA FERREIRA GARCIA
-- 23/05/2024

SELECT "ANA JULIA FERREIRA GARCIA";
select sleep(5);

use a2023951555@teiacoltec.org;

-- Questao 1: informar quantos emial da tabela Staff são da extenção .com
SELECT COUNT(idStaff) FROM Staff WHERE email LIKE '%.com';
select sleep(5);

-- Questa0 2: informar todos os vendedores, o total por eles vendidos, e o id do departamento
SELECT S.Nome AS idVendedor, SUM(V.ValorVenda) AS TotalVenda, L.idDepartamento FROM Staff S INNER JOIN Vendas V ON S.idStaff=V.idVendedor INNER JOIN Lotacao L ON S.idStaff=L.idStaff GROUP BY S.idStaff, V.idVendedor, L.idDepartamento;
select sleep(5);

-- Questao 3: informar o montante total vendido por cada departamento (valor total, o id e nome do departamento)
SELECT SUM(V.ValorVenda) AS TotalVendido, D.idDepartamento, D.Nome FROM Departamento D INNER JOIN Lotacao L ON D.idDepartamento=L.idDepartamento INNER JOIN Vendas V ON L.idStaff=V.idVendedor GROUP BY D.idDepartamento, L.idDepartamento;
select sleep(5);

-- Questao 4: listar o nome e o telefone dos gerentes
SELECT S.Nome, S.Fone FROM Staff S INNER JOIN Departamento D ON S.idStaff=D.Gerente;
select sleep(5);

-- Questao 5: litar o numero de funcionarios de cada departaemnto (num de funcionario, id e o nome do departamento)
SELECT COUNT(S.idStaff) AS NumFuncionarios, D.idDepartamento, D.Nome FROM Staff S INNER JOIN Lotacao L ON S.idStaff=L.idStaff INNER JOIN Departamento D ON L.idDepartamento=D.idDepartamento GROUP BY L.idDepartamento, D.idDepartamento;
select sleep(5);


use a2023951555@teiacoltec.org;

-- Questao 6: informar quantas regioes distintas tem na tabela Country
SELECT COUNT(DISTINCT Region) AS RegioesDistintas FROM Country;
select sleep(5);

-- Questao 7: listar o Nome, Expectativa de Vida e a regiao, mostrar os 10 melhores Expectetiva de Vida
SELECT Name, LifeExpectancy, Region FROM Country ORDER BY LifeExpectancy DESC LIMIT 10;
select sleep(5);

-- Questao 8: listar os 20 paises que possuem os maiores GNP, ordene pelo GPN decresente (nome do pais, regiao, populacao, GNP e expectativa de vida
SELECT Name, Region, Population, GNP, LifeExpectancy FROM Country ORDER BY GNP DESC LIMIT 20;
select sleep(5);

-- Questao 9: 20 melhores paises com maiores expectativas de vida, listar nome do pais, regiao, capital, populacao, GNP, expectatinva de vida
SELECT Name, Region, Capital, Population, GNP, LifeExpectancy FROM (SELECT * FROM Country ORDER BY LifeExpectancy DESC LIMIT 20) AS Paises  WHERE LifeExpectancy IS NOT NULL;
select sleep(5);

-- Questao 10: listar nome dos paises, media da populacao e a media do GDP na tabela country_stats (media calculada para todos os anos informados para cada pais, ordene a media do GDP em ordem decrescente)
SELECT C.Name, AVG(c.population) AS MediaPopulacao, AVG(c.gdp) AS MediaGDP FROM countries C INNER JOIN country_stats c ON C.country_id=c.country_id GROUP BY c.country_id, C.country_id ORDER BY MediaGDP DESC;
select sleep(5);

use a2023951555@teiacoltec.org;

-- Questao 4: crie pelo menos 5 consultas com as tabelas
-- Condicao (where)
SELECT Disciplina AS Disciplina203 FROM DadosTurmas WHERE Turma = 203;
select sleep(5);

-- Subconsulta
SELECT idProfessor, Disciplina  FROM (SELECT * FROM DadosTurmas WHERE Turma = 203) AS Turma203;
select sleep(5);

-- JOIN
SELECT P.Nome AS NomeProfessor, T.Disciplina FROM DadosProfessores P INNER JOIN DadosTurmas T ON P.id=T.idProfessor;
select sleep(5);

-- Funcao de agregacao
SELECT Turma, AVG(MediaTurmA) FROM DadosTurmas GROUP BY Turma;
select sleep(5);

-- Calculos
SELECT MAX(MediaTurmA) FROM DadosTurmas;
select sleep(5);


