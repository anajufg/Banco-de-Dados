<?php
/* Configurações de erro */
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

/* Chama o arquivo só uma vez */
require_once 'Tabela.php';
$t = new Tabela();

$dados = [];
$paises = [];
$divisoes = [];

if (isset($_GET['escolhaPais']) && $_GET['escolhaPais'] === 'true') {
    $p =  $_GET['escolha'];
    $dados = $t->obtemDadosPais($p);
} else if (isset($_GET['escolhaDiv']) && $_GET['escolhaDiv'] === 'true') {
    $d =  $_GET['escolha'];
    $f =  $_GET['faixa'];
    $dados = $t->obtemDadosDivisao($d, $f);
} else if (isset($_GET['escolhaMod']) && $_GET['escolhaMod'] === 'true') {
    $m = $_GET['modalidade'];
    $dados = $t->obtemDadosModalidade($m);
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
            <label for="escolha">Escolha um país e veja seus dados:</label>
            <select name="escolha" id="escolha" placeholder="País">
            <?php
                $paises = $t->obtemPaises();
                if(!empty($paises)) {
                    foreach($paises as $pais) {
                        /* htmlspecialchars($pais) para evitar problemas com caracteres especiais e também evitar vulnerabilidade do codigo */
                        echo "<option value=\"" . htmlspecialchars($pais['Country']) . "\">" . htmlspecialchars($pais['Country']) . "</option>";
                    }
                }
            ?>
            </select>
            <button class="botao" type="submit" name="escolhaPais" value="true">Procurar</button>
        </form>

        <form method="GET">
            <label for="escolha">Escolha os dados por divisão:</label>
            <select name="escolha" id="escolha">
            <?php
                $divisoes = $t->obtemDivisoes();
                if(!empty($divisoes)) {
                    foreach($divisoes as $divisao) {
                        /* htmlspecialchars($pais) para evitar problemas com caracteres especiais e também evitar vulnerabilidade do codigo */
                        echo "<option value=\"" . htmlspecialchars($divisao['Division']) . "\">" . htmlspecialchars($divisao['Division']) . "</option>";
                    }
                }
            ?>
            </select>

            <select name="faixa" id="faixa">
                <option value="todos">Todos</option>
                <option value="10p">10 primeiros</option>
                <option value="10u">10 últimos</option>
            </select>

            <button class="botao" type="submit" name="escolhaDiv" value="true">Procurar</button>
        </form>

        <form method="GET">
            <label for="escolha">Escolha os dados por modalidade:</label>
            <select name="modalidade" id="modalidade">
                <option value="Geral">Geral</option>
                <option value="Swim">Swim</option>
                <option value="Bike">Bike</option>
                <option value="Run">Run</option>
            </select>

            <button class="botao" type="submit" name="escolhaMod" value="true">Procurar</button>
        </form>

        <form method="GET">
            <button class="botao" type="submit" name="tabela" value="true">Tabela</button>    
        </form>
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
                                echo (isset($linha['Bib']) ? "<td>" . htmlspecialchars ($linha['Bib']) . "</td>" : '');
                                echo (isset($linha['Name']) ? "<td>" . htmlspecialchars($linha['Name']) . "</td>" : '');
                                echo (isset($linha['Country']) ? "<td>" . htmlspecialchars($linha['Country']) . "</td>" : '');
                                echo (isset($linha['Gender']) ? "<td>" . htmlspecialchars($linha['Gender']) . "</td>" : '');
                                echo (isset($linha['Division']) ? "<td>" . htmlspecialchars($linha['Division']) . "</td>" : '');
                                echo (isset($linha['Division_Rank']) ? "<td>" . htmlspecialchars($linha['Division_Rank']) . "</td>" : '');
                                echo (isset($linha['Overall_Time']) ? "<td>" . htmlspecialchars($linha['Overall_Time']) . "</td>" : '');
                                echo (isset($linha['Overall_Rank']) ? "<td>" . htmlspecialchars($linha['Overall_Rank']) . "</td>" : '');
                                echo (isset($linha['Swim_Time']) ? "<td>" . htmlspecialchars($linha['Swim_Time']) . "</td>" : '');
                                echo (isset($linha['Swim_Rank']) ? "<td>" . htmlspecialchars($linha['Swim_Rank']) . "</td>" : '');
                                echo (isset($linha['Bike_Time']) ? "<td>" . htmlspecialchars($linha['Bike_Time']) . "</td>" : '');
                                echo (isset($linha['Bike_Rank']) ? "<td>" . htmlspecialchars($linha['Bike_Rank']) . "</td>" : '');
                                echo (isset($linha['Run_Time']) ? "<td>" . htmlspecialchars($linha['Run_Time']) . "</td>" : '');
                                echo (isset($linha['Run_Rank']) ? "<td>" . htmlspecialchars($linha['Run_Rank']) . "</td>" : '');
                                echo (isset($linha['Finish_Status']) ? "<td>" . htmlspecialchars($linha['Finish_Status']) . "</td>" : '');
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
                                                           


