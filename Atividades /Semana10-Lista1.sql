-- ANA JULIA FERREIRA GARCIA
-- Lista 1
-- Semana 10

SELECT "ANA JULIA FERREIRA GARCIA";
SELECT sleep(5);

--  1.
SELECT "Questao 1.1";
SELECT "Feito no phpAdmin";
SELECT sleep(5);

use a2023951555@teiacoltec.org;
--  2.
SELECT "Questao 1.2";
SELECT ID, Nome, "Vendedor" AS Categoria 
    FROM tabela_vendedores
        WHERE cidade LIKE 'Londres' 
            UNION 
SELECT ID, Nome, "Cliente" AS Categoria 
    FROM tabela_clientes 
        WHERE cidade LIKE 'Londres';
SELECT sleep(5);

--  3.
SELECT "Questao 1.3";
SELECT DISTINCT ID, Cidade 
    FROM tabela_vendedores;
SELECT sleep(5);

--  4.
SELECT "Questao 1.4";
SELECT ID, Cidade 
    FROM tabela_vendedores ORDER BY ID ;
SELECT sleep(5);

--  5.
SELECT "Questao 1.5";
SELECT V.ID AS vendedorID, C.ID AS clienteID 
    FROM tabela_vendedores V 
        INNER JOIN tabela_pedidos P 
            ON V.ID = P.VendedorID 
        INNER JOIN tabela_clientes C 
            ON C.ID = P.ClienteID;
SELECT sleep(5);

--  6.
SELECT "Questao 1.6";
SELECT P.VendedorID, V.Nome, P.NumPedido, "maior" AS valorPedido, P.data 
	FROM tabela_pedidos P
    	INNER JOIN tabela_vendedores V 
        	ON P.VendedorID = V.ID 
        INNER JOIN (SELECT MAX(valorCompra) AS valorPedido FROM tabela_pedidos GROUP BY data) AS ma ON P.valorCompra = ma.valorPedido 
			UNION 
SELECT P.VendedorID, V.Nome, P.NumPedido, "menor" AS valorPedido, P.data 
    FROM tabela_pedidos P 
    	INNER JOIN tabela_vendedores V 
        	ON P.VendedorID = V.ID 
        INNER JOIN (SELECT MIN(valorCompra) AS valorPedido FROM tabela_pedidos GROUP BY data) AS mi ON P.valorCompra = mi.valorPedido;
SELECT sleep(5);
