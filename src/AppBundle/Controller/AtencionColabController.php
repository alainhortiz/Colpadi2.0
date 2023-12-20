<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class AtencionColabController extends Controller
{
    /**
     * @Route("/iniciarAtencionColab", name="iniciarAtencionColab")
     */
    public function iniciarAtencionColabAction()
    {
        return $this->render('AtencionColaborador/inicioAntencionColab.html.twig');
    }
}
