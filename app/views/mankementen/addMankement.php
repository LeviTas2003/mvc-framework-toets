<h3><?= $data['title']; ?></h3>

<p>TH-78-KL Ferrari</p>

<form action="<?= URLROOT ?>/mankementen/addMankement" method="post">
    <label for="topic">Mankement</label>

    <input type="text" name="mankement" id="mankement"><br>
    <input type="hidden" name="AutoId" value="2"><br>
    <input type="submit" value="Voer In">


</form>