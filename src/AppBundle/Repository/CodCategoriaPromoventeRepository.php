<?php

namespace AppBundle\Repository;

use AppBundle\Entity\CodCategoriaPromovente;

/**
 * CodCategoriaPromoventeRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class CodCategoriaPromoventeRepository extends \Doctrine\ORM\EntityRepository
{
    public function agregarCategoria($data)
    {
        try{
            $em = $this->getEntityManager();
            $categoria = new CodCategoriaPromovente();
            $categoria->setNombre(strtoupper($data['nombre']));

            $em->persist($categoria);
            $em->flush();
            $msg = $categoria;

        }catch (\Exception $e)
        {
            if(strpos($e->getMessage() , 'Duplicate entry') > 0)
            {
                $msg = 'La categoría ya existe , no se puede agregar';
            }
            else
            {
                $msg = 'Se produjo un error al insertar la categoría';
            }
        }

        return $msg;
    }

    public function modificarCategoria($data)
    {
        try
        {
            $em = $this->getEntityManager();
            $categoria = $em->getRepository('AppBundle:CodCategoriaPromovente')->find($data['idCategoria']);
            $categoria->setNombre(strtoupper($data['nombre']));

            $em->persist($categoria);
            $em->flush();
            $msg = $categoria;

        }catch (\Exception $e)
        {
            if(strpos($e->getMessage() , 'Duplicate entry') > 0)
            {
                $msg = 'Existe una categoría con este nombre  , no se puede hacer esta modificación';
            }
            else
            {
                $msg = 'Se produjo un error al modificar la categoría';
            }
        }

        return $msg;
    }

    public function eliminarCategoria($id)
    {
        try {
            $em = $this->getEntityManager();
            $categoria = $em->getRepository('AppBundle:CodCategoriaPromovente')->find($id);

            $em->remove($categoria);
            $em->flush();
            $msg = $categoria;

        } catch (\Exception $e) {

            if (strpos($e->getMessage(), 'foreign key') > 0) {
                $msg = 'Existen datos asociados a esta categoría , no se puede eliminar';
            } else {
                $msg = 'Se produjo un error al eliminar la categoría';
            }
        }
        return $msg;
    }
}