<h3><?= $data['title']; ?></h3>

<form action="<?= URLROOT ?>/mankementen/addMankement" method="post">
    <label for="topic">Mankement</label><br>
    <input type="text" name="topic" id="topic"><br>
    <input type="hidden" name="AutoId" value="<?= $data['AutoId']; ?>"><br>
    <input type="submit" value="Toevoegen">
</form>