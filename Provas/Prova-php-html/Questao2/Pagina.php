<?php
/* Configurações de erro */
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

/* Chama o arquivo só uma vez */
require_once 'Tabela.php';
$t = new Tabela();

$dados = [];

if (isset($_GET['pergunta1']) && $_GET['pergunta1'] === 'true') {
    $dados = $t->triatletasBrasileiros();
} else if (isset($_GET['pergunta2']) && $_GET['pergunta2'] === 'true') {
    $dados = $t->atletasPaises();
} else if (isset($_GET['pergunta3']) && $_GET['pergunta3'] === 'true') {
    $dados = $t->dadosProfissionais();
} else if (isset($_GET['pergunta4']) && $_GET['pergunta4'] === 'true') {
    $dados = $t->melhorBrasileiro();
} else if (isset($_GET['tabela']) && $_GET['tabela'] === 'true') {
    $dados = $t->imprimeTabela();
} else {
    $dados = $t->imprimeTabela();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style.css">
    <title>Home Page</title>
</head>
<body>
    <header>
        <form method="GET">
            <label for="pergunta">Quantos triatletas do Brasil participaram?</label>
            <button class="botao" type="submit" name="pergunta1" value="true">Procurar</button>
            <label for="respota"><?php if (isset($_GET['pergunta1']) && $_GET['pergunta1'] === 'true') { 
                                            $resposta = $t->numTriatletasBrasileiros(); 
                                            echo "<br>Resultado: " . $resposta['Numero'] . " triatletas";
                                        } ?>
            </label>
        </form>
        
        <div class="grupo-botao">
            <form method="GET">
                <button class="botao" type="submit" name="pergunta2" value="true">Número de atletas de cada país</button>    
            </form>

            <form method="GET">
                <button class="botao" type="submit" name="pergunta3" value="true">Dados dos atletas profissionais</button>    
            </form>

            <form method="GET">
                <button class="botao" type="submit" name="pergunta4" value="true">Melhor atleta brasileiro</button>    
            </form>

            <form method="GET">
                <button class="botao" type="submit" name="tabela" value="true">Tabela</button>    
            </form>
        </div>
    </header>

    <!-- Tela principal -->
    <div class="main">
        <div class="table-container">
            <table>
                <thead>
                    <tr class="titulo">
                        <?php
                            if (!empty($dados)) {
                                $titulos = array_keys($dados[0]);
                                foreach ($titulos as $titulo) {
                                    echo "<th>" . htmlspecialchars($titulo) . "</th>";
                                }
                            }
                        ?>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        if (!empty($dados)) {
                            foreach ($dados as $linha) {
                                echo "<tr>";
                                echo (isset($linha['Bib']) ? "<td>" . htmlspecialchars ($linha['Bib']) . "</td>" : ' ');
                                echo (isset($linha['Name']) ? "<td>" . htmlspecialchars($linha['Name']) . "</td>" : ' ');
                                echo (isset($linha['Country']) ? "<td>" . htmlspecialchars($linha['Country']) . "</td>" : ' ');
                                echo (isset($linha['Gender']) ? "<td>" . htmlspecialchars($linha['Gender']) . "</td>" : ' ');
                                echo (isset($linha['Division']) ? "<td>" . htmlspecialchars($linha['Division']) . "</td>" : ' ');
                                echo (isset($linha['Division_Rank']) ? "<td>" . htmlspecialchars($linha['Division_Rank']) . "</td>" : ' ');
                                echo (isset($linha['Overall_Time']) ? "<td>" . htmlspecialchars($linha['Overall_Time']) . "</td>" : ' ');
                                echo (isset($linha['Overall_Rank']) ? "<td>" . htmlspecialchars($linha['Overall_Rank']) . "</td>" : ' ');
                                echo (isset($linha['Swim_Time']) ? "<td>" . htmlspecialchars($linha['Swim_Time']) . "</td>" : ' ');
                                echo (isset($linha['Swim_Rank']) ? "<td>" . htmlspecialchars($linha['Swim_Rank']) . "</td>" : ' ');
                                echo (isset($linha['Bike_Time']) ? "<td>" . htmlspecialchars($linha['Bike_Time']) . "</td>" : ' ');
                                echo (isset($linha['Bike_Rank']) ? "<td>" . htmlspecialchars($linha['Bike_Rank']) . "</td>" : ' ');
                                echo (isset($linha['Run_Time']) ? "<td>" . htmlspecialchars($linha['Run_Time']) . "</td>" : ' ');
                                echo (isset($linha['Run_Rank']) ? "<td>" . htmlspecialchars($linha['Run_Rank']) . "</td>" : ' ');
                                echo (isset($linha['Finish_Status']) ? "<td>" . htmlspecialchars($linha['Finish_Status']) . "</td>" : ' ');
                                echo (isset($linha['Numero_Atletas']) ? "<td>" . htmlspecialchars($linha['Numero_Atletas']) . "</td>" : ' ');
                                echo (isset($linha['Diferenca_Posicao_Swim_Bike']) ? "<td>" . htmlspecialchars($linha['Diferenca_Posicao_Swim_Bike']) . "</td>" : ' ');
                                echo (isset($linha['Diferenca_Posicao_Swim_Run']) ? "<td>" . htmlspecialchars($linha['Diferenca_Posicao_Swim_Run']) . "</td>" : ' ');
                                echo (isset($linha['Diferenca_Posicao_Bike_Run']) ? "<td>" . htmlspecialchars($linha['Diferenca_Posicao_Bike_Run']) . "</td>" : ' ');
                                echo (isset($linha['Media_Natacao_Bike_Corrida']) ? "<td>" . htmlspecialchars($linha['Media_Natacao_Bike_Corrida']) . "</td>" : ' ');
                                echo "</tr>";
                            }
                        } else {
                            echo "<tr><td colspan='6'>Não há registros!</td></tr>";
                        }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
                                                           


