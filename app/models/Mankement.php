<?php

class Mankement
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function addMankement($post)
    {
        if (strlen($post['mankement']) <= 50) {
            $sql = "INSERT INTO Mankement (AutoId
                                          ,Mankement
                                          ,Datum)
                    VALUES                (:autoId
                                          ,:mankement
                                          ,'2023-01-09')";

            $this->db->query($sql);
            $this->db->bind(':autoId', 2, PDO::PARAM_INT);
            $this->db->bind(':mankement', $post['mankement'], PDO::PARAM_STR);
            return $this->db->execute();
        } else {
            echo "<p>Het nieuwe mankement is meer dan 50 tekens lang en is niet toegevoegd, probeer het opnieuw</p>";
            header('Refresh:3; url=' . URLROOT . '/mankementen/addMankement');
        }
    }

    public function getMankementen()
    {
        $this->db->query("SELECT Auto.Id
                                ,Mankement.mankement
                                ,Mankement.Datum
                                ,Instructeur.Naam
                                ,Instructeur.Email
                                ,Auto.Kenteken
                          FROM Instructeur
                          INNER JOIN Auto
                          ON Instructeur.Id = Auto.InstructeurId
                          INNER JOIN Mankement
                          ON Auto.Id = Mankement.AutoId
                          WHERE Instructeur.Id = :Id
                          Order By Mankement.Datum Desc");

        $this->db->bind(':Id', 2);

        $result = $this->db->resultSet();

        return $result;
    }
}
