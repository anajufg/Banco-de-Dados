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

    /* Numero de triatletas brasileiros */
    public function numTriatletasBrasileiros() {
        $stmt = $this->pdo->query("SELECT COUNT(Bib) AS Numero FROM " . $this->tabela . " WHERE Country = 'Brazil'");
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    /* Triatletas brasileiros */
    public function triatletasBrasileiros() {
        $stmt = $this->pdo->query("SELECT * FROM " . $this->tabela . " WHERE Country = 'Brazil'");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /* Paises e seus atletas */
    public function atletasPaises() {
        $stmt = $this->pdo->query("SELECT Country, COUNT(Bib) AS Numero_Atletas FROM " . $this->tabela  . " GROUP BY Country ORDER BY Numero_Atletas DESC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /* Dados atletas profissionais */
    public function dadosProfissionais() {
        $stmt = $this->pdo->query("SELECT Name, Country, Swim_Time, Swim_Rank, Bike_Time, Bike_Rank, Run_Time, Run_Rank, 
                                    IF (Swim_Rank > Bike_Rank, (Swim_Rank-Bike_Rank), (Bike_Rank-Swim_Rank)) AS Diferenca_Posicao_Swim_Bike,
                                    IF (Swim_Rank > Run_Rank, (Swim_Rank-Run_Rank), (Run_Rank-Swim_Rank)) AS Diferenca_Posicao_Swim_Run,
                                    IF (Bike_Rank > Run_Rank, (Bike_Rank-Run_Rank), (Run_Rank-Bike_Rank)) AS Diferenca_Posicao_Bike_Run
                                    FROM " . $this->tabela  . " WHERE Division = 'MPRO'");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /* Melhor atleta brasileiro */
    public function melhorBrasileiro() {
        $stmt = $this->pdo->query("SELECT Name, ((Swim_Time+Bike_Rank+Run_Rank)/3) AS Media_Natacao_Bike_Corrida FROM " . $this->tabela . " WHERE Country = 'Brazil' ORDER BY Overall_Rank ASC LIMIT 1");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>
