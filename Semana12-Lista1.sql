-- ANA JULIA FERREIRA GARCIA
-- Lista 1
-- Semana 12

SELECT "ANA JULIA FERREIRA GARCIA";
SELECT sleep(5);

use a2023951555@teiacoltec.org;

--  1.
SELECT "Questao 1";
SELECT "Feito no LibreOffice";
SELECT sleep(5);

--  2.
SELECT "Questao 2";
SELECT "Feito no phpAdmin";
SELECT sleep(5);

--  3.
SELECT "Questao 3";
SELECT "Feito no phpAdmin manualmente :(";
INSERT INTO `Pagamentos` (`VendedorID`, `salario`) VALUES ('1', '1100'), ('2', '1000'), ('77', '1000'), ('88', '1000'), ('3', '1000');
SELECT sleep(5);

--  4.
SELECT "Questao 1.2";
SELECT "Questao 1.";
SELECT C.codigo, COUNT(S.idStaff) AS NumFuncionarios FROM CodigoStaff C INNER JOIN Staff S ON C.codigo = S.Funcao GROUP BY S.Funcao;
SELECT sleep(5);

--  5.
SELECT "Questao 1.2";
SELECT "Questao 2.";
SELECT C.Funcao, COUNT(S.idStaff) AS NumFuncionarios FROM CodigoStaff C INNER JOIN Staff S ON C.codigo = S.Funcao GROUP BY S.Funcao;
SELECT sleep(5);

--  6.
SELECT "Questao 1.2";
SELECT "Questao 3.";
SELECT DISTINCT S.Nome FROM Staff S INNER JOIN Vendas V ON S.idStaff = V.idVendedor WHERE V.DataVenda LIKE '%24';
SELECT sleep(5);

--  7.
SELECT "Questao 1.2";
SELECT "Questao 4.";
SELECT S.Nome, D.Nome AS Departamento FROM Staff S INNER JOIN Lotacao L ON S.idStaff = L.idStaff INNER JOIN Departamento D ON L.idDepartamento = D.idDepartamento WHERE L.Status LIKE '0';
SELECT sleep(5);

--  8.
SELECT "Questao 1.2";
SELECT "Questao 5.";
SELECT P.idProduto, P.Nome, E.Quantidade, P.ValorUnitario, (E.Quantidade*P.ValorUnitario) AS Montante FROM Produtos P INNER JOIN Estoque E ON P.idProduto = E.idProduto;
SELECT sleep(5);

--  9.
SELECT "Questao 1.2";
SELECT "Questao 6.";
SELECT Nome, DataAdmissao FROM Staff WHERE email LIKE '%gmail%';
SELECT sleep(5);
