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
        $sql = "INSERT INTO Onderwerp (AutoId
                                      ,Onderwerp)
                VALUES                (:autoId
                                      ,:topic)";

        $this->db->query($sql);
        $this->db->bind(':autoId', $post['autoId'], PDO::PARAM_INT);
        $this->db->bind(':topic', $post['topic'], PDO::PARAM_STR);
        return $this->db->execute();
    }

    public function getMankementen()
    {
        $this->db->query("SELECT Auto.Id
                                ,Mankement.mankement
                          FROM Instructeur
                          INNER JOIN Auto
                          ON Instructeur.Id = Auto.InstructeurId
                          INNER JOIN Mankement
                          ON Auto.Id = Mankement.AutoId
                          WHERE Instructeur.Id = :Id");

        $this->db->bind(':Id', 2);

        $result = $this->db->resultSet();

        return $result;
    }
}
