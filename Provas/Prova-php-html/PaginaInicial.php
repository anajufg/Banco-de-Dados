<?php
/* Configurações de erro */
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if (isset($_GET['questao1']) && $_GET['questao1'] === 'true') {
    header('location: Questao1/Pagina.php');
    exit();
} else if (isset($_GET['questao2']) && $_GET['questao2'] === 'true') {
    header('location: Questao2/Pagina.php');
    exit();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Página Inicial</title>
</head>
<body>
    <header>
        <div class="grupo-botao">
            <label>Prova A<br></label>
            <form method="GET">
                <button class="botao" type="submit" name="questao1" value="true">Questão 1</button>    
            </form>

            <form method="GET">
                <button class="botao" type="submit" name="questao2" value="true">Questão 2</button>    
            </form>
        </div>
    </header>
</body>
</html>
                                                           


