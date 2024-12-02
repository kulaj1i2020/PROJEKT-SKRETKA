<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <header>
        <h1> Szkoła językowa </h1>
    </header>
    <main>
    <form action="#" method="post">
    <h2>Dodaj ucznia</h2>
    Imię: <input type="text" name="imie">
    Nazwisko: <input type="text" name="nazwisko">
    Język: <input type="text" name="jezyk">

    <input type="submit" name="submit" value="dodaj">


    </form>
    <?php
    $dobazy=mysqli_connect('localhost','root','','szkola_jezykowa');

    if(!$dobazy)
    {
        echo "Błąd połączenia z bazą";
        exit;
    }
    else
    {
        if($_POST['submit']=='dodaj')
        {
            if(isset($_POST['imie'])&& isset($_POST['nazwisko']))
            {
                $imie=$_POST['imie'];
                $nazwisko=$_POST['nazwisko'];
            $zapytanie=mysqli_query($dobazy,'Insert INTO uczniowie("imie","nazwisko", VALUES('$imie','$naziwsko');');

            echo "dodano";
            }
        }
    }
    ?>
</main>
</body>
</html>