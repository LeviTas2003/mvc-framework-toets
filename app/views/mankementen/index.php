<h3><?= $data['title'] ?></h3>

<p>Auto van Instructeur: Manhoi</p>
<p>E-mailadres : manhoi@gmail.com</p>
<p>Kenteken Auto : TH-78-KL - Ferrari</p>

<table border='1'>
    <thead>
        <th>Datum</th>
        <th>Mankement</th>
    </thead>
    <tbody>
        <?= $data['rows'] ?>
    </tbody>
</table>

<a href="<?= URLROOT; ?>/mankementen/addMankement/2">
    <input type="button" value="Mankement toevoegen">
</a>