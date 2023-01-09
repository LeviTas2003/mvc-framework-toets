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
        foreach ($result as $info) {

            $rows .= "<tr>
                        <td>$info->Datum</td>
                        <td>$info->mankement</td>
                    </tr>";
        }

        $data = [
            'title' => "Overzicht Mankementen",
            'rows' => $rows
        ];
        $this->view('mankementen/index', $data);
    }



    function addMankement($AutoId = NULL)
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            // var_dump($_POST);
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            $result = $this->mankementModel->addMankement($_POST);

            if ($result) {
                echo "<p>Het nieuwe mankement is succesvol toegevoegd</p>";
                header('Refresh:3; url=' . URLROOT . '/mankementen/index');
            } else {
            }
        }

        $data = [
            'title' => 'Invoegen Mankement',
            'AutoId' => 2
        ];
        $this->view('mankementen/addMankement', $data);
    }
}
