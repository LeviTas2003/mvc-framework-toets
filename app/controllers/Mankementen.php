<?php

class Mankementen extends Controller
{

    public function __construct()
    {
        $this->mankementModel = $this->model('Les');
    }

    public function index()
    {
        $result = $this->mankementModel->getLessons();

        // var_dump($result);
        $rows = '';
        foreach ($result as $info) {
            $d = new DateTimeImmutable($info->DatumTijd, new DateTimeZone('Europe/Amsterdam'));
            $rows .= "<tr>
                        <td>{$d->format('d-m-Y')}</td>
                        <td>{$d->format('H:i')}</td>
                        <td>$info->Naam</td>
                        <td><a href=''><img src='" . URLROOT . "/img/b_help.png' alt='questionmark'></a></td>
                        <td><a href='" . URLROOT . "/lessen/topicslesson/{$info->Id}'><img src='" . URLROOT . "/img/b_props.png' alt='topiclist'></a></td>
                    </tr>";
        }

        $data = [
            'title' => "Overzicht Rijlessen",
            'rows' => $rows
        ];
        $this->view('lessen/index', $data);
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
            header('Refresh:3; url=' . URLROOT . '/lessen/index');
        }

        $data = [
            'title' => 'Mankement Toevoegen',
            'AutoId' => $AutoId
        ];
        $this->view('mankementen/addMankement', $data);
    }
}
