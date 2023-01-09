<?php

class Mankementen extends Controller
{

    public function __construct()
    {
        $this->mankementModel = $this->model('Mankement');
    }

    public function index()
    {
        $result = $this->mankementModel->getMankementen(2);

        // var_dump($result);
        $rows = '';


        $data = [
            'title' => "Overzicht Mankementen",
            'rows' => $rows
        ];
        $this->view('mankementen/index', $data);
    }

    function topicsLesson($AutoId)
    {
        $result = $this->mankementModel->getTopicsLesson($AutoId);

        // var_dump($result);

        $rows = "";
        foreach ($result as $topic) {
            $rows .= "<tr>      
                        <td>$topic->Onderwerp</td>
                      </tr>";
        }


        $data = [
            'title' => 'Onderwerpen Les',
            'rows'  => $rows,
            'AutoId' => $AutoId
        ];
        $this->view('lessen/topicslesson', $data);
    }

    function addMankement($AutoId = NULL)
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            // var_dump($_POST);
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            $result = $this->mankementModel->addTopic($_POST);

            if ($result) {
                echo "<p>Het nieuwe mankement is succesvol toegevoegd</p>";
            } else {
                echo "<p>Het nieuwe mankement is niet toegevoegd</p>";
            }
            header('Refresh:3; url=' . URLROOT . '/mankementen/index');
        }

        $data = [
            'title' => 'Mankement Toevoegen',
            'AutoId' => $AutoId
        ];
        $this->view('mankementen/addMankement', $data);
    }
}
