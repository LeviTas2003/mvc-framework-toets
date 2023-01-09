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

    public function getMankementen($instructeurId)
    {
        $this->db->query("SELECT *
                          FROM Auto
                          WHERE InstructeurId = :instructeurId");
        $this->db->bind(':instructeurId', $instructeurId);

        $result = $this->db->resultSet();

        return $result;
    }
}
