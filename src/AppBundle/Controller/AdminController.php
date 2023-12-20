<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class AdminController extends Controller
{
    /**
     * @Route("/iniciarAdministracion", name="iniciarAdministracion")
     */
    public function iniciarAdministracionAction()
    {
        return $this->render('Administracion/inicioAdministrador.html.twig');
    }

    /**
     * @Route("/gestionarProvincias", name="gestionarProvincias")
     */
    public function gestionarProvinciasAction()
    {
        $em = $this->getDoctrine()->getManager();
        $provincias  = $em->getRepository('AppBundle:CodProvincia')->findAll();

        /*$this->forward('AppBundle:Traza:insertTraza' , array(
            'operacion' => 'Nomencladores - Gestionar Provincias',
            'descripcion' => 'Listado de provincias'
        ));*/

        return $this->render('Administracion/Nomencladores/GestionProvincia/gestionProvincias.html.twig' , array('provincias' => $provincias));
    }


    /**
     * @Route("/insertProvincia", name="insertProvincia")
     */
    public function insertProvinciaAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $data = array(
            'codigo' => $peticion->request->get('codigo'),
            'nombre' => $peticion->request->get('nombre'),
        );
        $resp = $em->getRepository('AppBundle:CodProvincia')->agregarProvincia($data);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Insertar Provincia',
                'descripcion' => 'Se insertó una nueva provincia con el nombre: '.$data['nombre']
            ));*/
            return new Response('ok');
        }

    }

    /**
     * @Route("/updateProvincia", name="updateProvincia")
     */
    public function updateProvinciaAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $data = array(
            'idProvincia' => $peticion->request->get('idProvincia'),
            'codigo' => $peticion->request->get('codigo'),
            'nombre' => $peticion->request->get('nombre'),
        );

        $resp = $em->getRepository('AppBundle:CodProvincia')->modificarProvincia($data);


        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Modificar provincia',
                'descripcion' => 'Se modificó la provincia:  '.$data['nombre']
            ));*/
            return new Response('ok');
        }
    }

    /**
     * @Route("/deleteProvincia", name="deleteProvincia")
     */
    public function deleteProvinciaAction()
    {
        $peticion = Request::createFromGlobals();
        $idProvincia = $peticion->request->get('idProvincia');
        $em = $this->getDoctrine()->getManager();

        $resp  = $em->getRepository('AppBundle:CodProvincia')->eliminarProvincia($idProvincia);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Eliminar Provincia',
                'descripcion' => 'Se eliminó la provincia: '.$resp->getNombre()
            ));*/
            return new Response('ok');
        }
    }

    /**
     * @Route("/gestionarMunicipios", name="gestionarMunicipios")
     */
    public function gestionarMunicipiosAction()
    {
        $em = $this->getDoctrine()->getManager();
        $municipios  = $em->getRepository('AppBundle:CodMunicipio')->findAll();
        $provincias = $em->getRepository('AppBundle:CodProvincia')->findAll();

        /*$this->forward('AppBundle:Traza:insertTraza' , array(
            'operacion' => 'Nomencladores - Gestionar Municipios',
            'descripcion' => 'Listado de municipios'
        ));*/

        return $this->render('Administracion/Nomencladores/GestionMunicipio/gestionMunicipios.html.twig', array('municipios' => $municipios , 'provincias' => $provincias));
    }

    /**
     * @Route("/insertMunicipio", name="insertMunicipio")
     */
    public function insertMunicipioAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $data = array(
            'codigo' => $peticion->request->get('codigo'),
            'nombre' => $peticion->request->get('nombre'),
            'idProvincia' => $peticion->request->get('provincia'),
        );
        $resp = $em->getRepository('AppBundle:CodMunicipio')->agregarMunicipio($data);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Insertar Municipio',
                'descripcion' => 'Se insertó un nuevo municipio con el nombre: '.$data['nombre']
            ));*/
            return new Response('ok');
        }
    }

    /**
     * @Route("/updateMunicipio", name="updateMunicipio")
     */
    public function updateMunicipioAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $data = array(
            'idMunicipio' => $peticion->request->get('idMunicipio'),
            'codigo' => $peticion->request->get('codigo'),
            'nombre' => $peticion->request->get('nombre'),
            'idProvincia' => $peticion->request->get('provincia')
        );

        $resp = $em->getRepository('AppBundle:CodMunicipio')->modificarMunicipio($data);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Modificar Municipio',
                'descripcion' => 'Se modificó el municipio:  '.$data['nombre']
            ));*/
            return new Response('ok');
        }
    }

    /**
     * @Route("/deleteMunicipio", name="deleteMunicipio")
     */
    public function deleteMunicipioAction()
    {
        $peticion = Request::createFromGlobals();
        $idMunicipio = $peticion->request->get('idMunicipio');
        $em = $this->getDoctrine()->getManager();

        $resp  = $em->getRepository('AppBundle:CodMunicipio')->eliminarMunicipio($idMunicipio);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Eliminar Municipio',
                'descripcion' => 'Se eliminó el municipio: '.$resp->getNombre()
            ));*/
            return new Response('ok');
        }
    }

    /**
     * @Route("/gestionarPaises", name="gestionarPaises")
     */
    public function gestionarPaisesAction()
    {
        $em = $this->getDoctrine()->getManager();
        $paises  = $em->getRepository('AppBundle:CodPais')->findAll();

        /*$this->forward('AppBundle:Traza:insertTraza' , array(
            'operacion' => 'Nomencladores - Gestionar Paises',
            'descripcion' => 'Listado de paises'
        ));*/

        return $this->render('Administracion/Nomencladores/GestionPais/gestionPaises.html.twig' , array('paises' => $paises));
    }
    /**
     * @Route("/insertPais", name="insertPais")
     */
    public function insertPaisAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $data = array(
            'codigo' => $peticion->request->get('codigo'),
            'nombre' => $peticion->request->get('nombre'),
        );
        $resp = $em->getRepository('AppBundle:CodPais')->agregarPais($data);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Insertar País',
                'descripcion' => 'Se insertó el país: '.$data['nombre']
            ));*/
            return new Response('ok');
        }

    }

    /**
     * @Route("/updatePais", name="updatePais")
     */
    public function updatePaisAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $data = array(
            'idPais' => $peticion->request->get('idPais'),
            'codigo' => $peticion->request->get('codigo'),
            'nombre' => $peticion->request->get('nombre'),
        );

        $resp = $em->getRepository('AppBundle:CodPais')->modificarPais($data);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Modificar País',
                'descripcion' => 'Se modificó el país:  '.$data['nombre']
            ));*/
            return new Response('ok');
        }
    }

    /**
     * @Route("/deletePais", name="deletePais")
     */
    public function deletePaisAccion()
    {
        $peticion = Request::createFromGlobals();
        $idPais = $peticion->request->get('idPais');
        $em = $this->getDoctrine()->getManager();

        $resp  = $em->getRepository('AppBundle:CodPais')->eliminarPais($idPais);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Eliminar País',
                'descripcion' => 'Se eliminó el país: '.$resp->getNombre()
            ));*/
            return new Response('ok');
        }
    }

    /**
     * @Route("/gestionarCategorias", name="gestionarCategorias")
     */
    public function gestionarCategoriasAction()
    {
        $em = $this->getDoctrine()->getManager();
        $categorias  = $em->getRepository('AppBundle:CodCategoriaPromovente')->findAll();

        /*$this->forward('AppBundle:Traza:insertTraza' , array(
            'operacion' => 'Nomencladores - Gestionar Categorias',
            'descripcion' => 'Listado de Categorias'
        ));*/

        return $this->render('Administracion/Nomencladores/GestionCategoria/gestionCategorias.html.twig' , array('categorias' => $categorias));
    }

    /**
     * @Route("/insertCategoria", name="insertCategoria")
     */
    public function insertCategoriaAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $data = array(
            'nombre' => $peticion->request->get('nombre'),
        );
        $resp = $em->getRepository('AppBundle:CodCategoriaPromovente')->agregarCategoria($data);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Insertar Categoria',
                'descripcion' => 'Se insertó una nueva Categoria con el nombre: '.$data['nombre']
            ));*/
            return new Response('ok');
        }

    }

    /**
     * @Route("/updateCategoria", name="updateCategoria")
     */
    public function updateCategoriaAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $data = array(
            'idCategoria' => $peticion->request->get('idCategoria'),
            'nombre' => $peticion->request->get('nombre'),
        );

        $resp = $em->getRepository('AppBundle:CodCategoriaPromovente')->modificarCategoria($data);


        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Modificar Categoria',
                'descripcion' => 'Se modificó la Categoria:  '.$data['nombre']
            ));*/
            return new Response('ok');
        }
    }

    /**
     * @Route("/deleteCategoria", name="deleteCategoria")
     */
    public function deleteCategoriaAction()
    {
        $peticion = Request::createFromGlobals();
        $idCategoria = $peticion->request->get('idCategoria');
        $em = $this->getDoctrine()->getManager();

        $resp  = $em->getRepository('AppBundle:CodCategoriaPromovente')->eliminarCategoria($idCategoria);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Eliminar Categoria',
                'descripcion' => 'Se eliminó la Categoria: '.$resp->getNombre()
            ));*/
            return new Response('ok');
        }
    }

    /**
     * @Route("/gestionarConceptosReclamacion", name="gestionarConceptosReclamacion")
     */
    public function gestionarConceptosReclamacionAction()
    {
        $em = $this->getDoctrine()->getManager();
        $conceptos  = $em->getRepository('AppBundle:CodConceptoReclamacion')->findAll();

        /*$this->forward('AppBundle:Traza:insertTraza' , array(
            'operacion' => 'Nomencladores - Gestionar Categorias',
            'descripcion' => 'Listado de Categorias'
        ));*/

        return $this->render('Administracion/Nomencladores/GestionConceptoReclamacion/gestionConceptosReclamacion.html.twig' , array('conceptos' => $conceptos));
    }

    /**
     * @Route("/insertConceptoReclamacion", name="insertConceptoReclamacion")
     */
    public function insertConceptoReclamacionAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $data = array(
            'nombre' => $peticion->request->get('nombre'),
        );
        $resp = $em->getRepository('AppBundle:CodConceptoReclamacion')->agregarConceptoReclamacion($data);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Insertar Categoria',
                'descripcion' => 'Se insertó una nueva Categoria con el nombre: '.$data['nombre']
            ));*/
            return new Response('ok');
        }

    }

    /**
     * @Route("/updateConceptoReclamacion", name="updateConceptoReclamacion")
     */
    public function updateConceptoReclamacionAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $data = array(
            'idConceptoReclamacion' => $peticion->request->get('idConceptoReclamacion'),
            'nombre' => $peticion->request->get('nombre'),
        );

        $resp = $em->getRepository('AppBundle:CodConceptoReclamacion')->modificarConceptoReclamacion($data);


        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Modificar Categoria',
                'descripcion' => 'Se modificó la Categoria:  '.$data['nombre']
            ));*/
            return new Response('ok');
        }
    }

    /**
     * @Route("/deleteConceptoReclamacion", name="deleteConceptoReclamacion")
     */
    public function deleteConceptoReclamacionAction()
    {
        $peticion = Request::createFromGlobals();
        $idConceptoReclamacion = $peticion->request->get('idConceptoReclamacion');
        $em = $this->getDoctrine()->getManager();

        $resp  = $em->getRepository('AppBundle:CodConceptoReclamacion')->eliminarConceptoReclamacion($idConceptoReclamacion);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Eliminar Categoria',
                'descripcion' => 'Se eliminó la Categoria: '.$resp->getNombre()
            ));*/
            return new Response('ok');
        }
    }

    /**
     * @Route("/gestionarConclusiones", name="gestionarConclusiones")
     */
    public function gestionarConclusionesAction()
    {
        $em = $this->getDoctrine()->getManager();
        $conclusiones  = $em->getRepository('AppBundle:CodConclusion')->findAll();

        /*$this->forward('AppBundle:Traza:insertTraza' , array(
            'operacion' => 'Nomencladores - Gestionar Categorias',
            'descripcion' => 'Listado de Categorias'
        ));*/

        return $this->render('Administracion/Nomencladores/GestionConclusion/gestionConclusiones.html.twig' , array('conclusiones' => $conclusiones));
    }

    /**
     * @Route("/insertConclusion", name="insertConclusion")
     */
    public function insertConclusionAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $data = array(
            'nombre' => $peticion->request->get('nombre'),
        );
        $resp = $em->getRepository('AppBundle:CodConclusion')->agregarConclusion($data);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Insertar Categoria',
                'descripcion' => 'Se insertó una nueva Categoria con el nombre: '.$data['nombre']
            ));*/
            return new Response('ok');
        }

    }

    /**
     * @Route("/updateConclusion", name="updateConclusion")
     */
    public function updateConclusionAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $data = array(
            'idConclusion' => $peticion->request->get('idConclusion'),
            'nombre' => $peticion->request->get('nombre'),
        );

        $resp = $em->getRepository('AppBundle:CodConclusion')->modificarConclusion($data);


        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Modificar Categoria',
                'descripcion' => 'Se modificó la Categoria:  '.$data['nombre']
            ));*/
            return new Response('ok');
        }
    }

    /**
     * @Route("/deleteConclusion", name="deleteConclusion")
     */
    public function deleteConclusionAction()
    {
        $peticion = Request::createFromGlobals();
        $idConclusion = $peticion->request->get('idConclusion');
        $em = $this->getDoctrine()->getManager();

        $resp  = $em->getRepository('AppBundle:CodConclusion')->eliminarConclusion($idConclusion);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Eliminar Categoria',
                'descripcion' => 'Se eliminó la Categoria: '.$resp->getNombre()
            ));*/
            return new Response('ok');
        }
    }

    /**
     * @Route("/gestionarReclamacionLugares", name="gestionarReclamacionLugares")
     */
    public function gestionarReclamacionLugaresAction()
    {
        $em = $this->getDoctrine()->getManager();
        $lugares  = $em->getRepository('AppBundle:CodReclamacionLugar')->findAll();

        /*$this->forward('AppBundle:Traza:insertTraza' , array(
            'operacion' => 'Nomencladores - Gestionar Municipios',
            'descripcion' => 'Listado de municipios'
        ));*/

        return $this->render('Administracion/Nomencladores/GestionReclamacionLugar/gestionReclamacionLugares.html.twig', array('lugares' => $lugares));
    }

    /**
     * @Route("/insertReclamacionLugar", name="insertReclamacionLugar")
     */
    public function insertReclamacionLugarAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $data = array(
            'nombre' => $peticion->request->get('nombre'),
        );
        $resp = $em->getRepository('AppBundle:CodReclamacionLugar')->agregarReclamacionLugar($data);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Insertar Municipio',
                'descripcion' => 'Se insertó un nuevo municipio con el nombre: '.$data['nombre']
            ));*/
            return new Response('ok');
        }
    }

    /**
     * @Route("/updateReclamacionLugar", name="updateReclamacionLugar")
     */
    public function updateReclamacionLugarAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $data = array(
            'idReclamacionLugar' => $peticion->request->get('idReclamacionLugar'),
            'nombre' => $peticion->request->get('nombre'),
        );

        $resp = $em->getRepository('AppBundle:CodReclamacionLugar')->modificarReclamacionLugar($data);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Modificar Municipio',
                'descripcion' => 'Se modificó el municipio:  '.$data['nombre']
            ));*/
            return new Response('ok');
        }
    }

    /**
     * @Route("/deleteReclamacionLugar", name="deleteReclamacionLugar")
     */
    public function deleteReclamacionLugarAction()
    {
        $peticion = Request::createFromGlobals();
        $idReclamacionLugar = $peticion->request->get('idReclamacionLugar');
        $em = $this->getDoctrine()->getManager();

        $resp  = $em->getRepository('AppBundle:CodReclamacionLugar')->eliminarReclamacionLugar($idReclamacionLugar);

        if(is_string($resp)) return new Response($resp);
        else{
            /*$this->forward('AppBundle:Traza:insertTraza' , array(
                'operacion' => 'Eliminar Municipio',
                'descripcion' => 'Se eliminó el municipio: '.$resp->getNombre()
            ));*/
            return new Response('ok');
        }
    }


}
