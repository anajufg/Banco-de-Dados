<?php
require_once 'Conexao.php';

class Tabela {
    private $pdo;
    private $tabela;

    public function __construct() {
        $conexao = new Conexao();
        $this->pdo = $conexao->getPdo();
        $this->tabela = 'resultado_imiron' ;
    }

    /* Imprime toda a tabela */
    public function imprimeTabela() {
        $stmt = $this->pdo->query("SELECT * FROM " . $this->tabela);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /* Obtem lista de paises */
    public function obtemPaises() {
        $stmt = $this->pdo->query("SELECT DISTINCT Country FROM " . $this->tabela);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /* Lista os dados de um pais */
    public function obtemDadosPais($pais) {
        $stmt = $this->pdo->prepare("SELECT * FROM " . $this->tabela  . " WHERE Country = :c");
        $stmt->bindValue(":c", $pais);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /* Obtem lista de divisoes */
     public function obtemDivisoes() {
        $stmt = $this->pdo->query("SELECT DISTINCT Division FROM " . $this->tabela);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /* Lista os dados de uma divisao */
    public function obtemDadosDivisao($divisao, $faixa) {

        if ($faixa == 'todos') {
            $stmt = $this->pdo->prepare("SELECT * FROM " . $this->tabela  . " WHERE Division = :d");
            $stmt->bindValue(":d", $divisao);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } else if ($faixa == '10p') {
            $stmt = $this->pdo->prepare("SELECT * FROM " . $this->tabela  . " WHERE Division = :d AND Division_Rank IS NOT NULL ORDER BY Division_Rank ASC LIMIT 10");
            $stmt->bindValue(":d", $divisao);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } else if ($faixa == '10u') {
            $stmt = $this->pdo->prepare("SELECT * FROM " . $this->tabela  . " WHERE Division = :d AND Division_Rank IS NOT NULL ORDER BY Division_Rank DESC LIMIT 10");
            $stmt->bindValue(":d", $divisao);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
    
    /* Lista os dados de uma modalidade */
    public function obtemDadosModalidade($modalidade) {

        if ($modalidade == 'Geral') {
            $stmt = $this->pdo->query("SELECT Bib, Name, Country, Gender, Overall_Time, Overall_Rank FROM " . $this->tabela);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } else if ($modalidade == 'Swim') {
            $stmt = $this->pdo->query("SELECT Bib, Name, Country, Gender, Swim_Time, Swim_Rank FROM " . $this->tabela);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } else if ($modalidade == 'Bike') {
            $stmt = $this->pdo->query("SELECT Bib, Name, Country, Gender, Bike_Time, Bike_Rank FROM " . $this->tabela);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } else if ($modalidade == 'Run') {
            $stmt = $this->pdo->query("SELECT Bib, Name, Country, Gender, Run_Time, Run_Rank FROM " . $this->tabela);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }

}
?>
