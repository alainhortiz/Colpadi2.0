<?php

namespace AppBundle\Repository;
use Symfony\Component\Security\Core\Encoder\BCryptPasswordEncoder;
use AppBundle\Entity\Usuario;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * UsuarioRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class UsuarioRepository extends \Doctrine\ORM\EntityRepository
{
    public function cambiarPassword($username , $passNew)
    {
        try
        {
            $em = $this->getEntityManager();
            $user = $em->getRepository('AppBundle:Usuario')->findOneBy(array('username' => $username));
            $encoder = new BCryptPasswordEncoder(12);
            $passNew = $encoder->encodePassword($passNew , null);
            $user->setPassword($passNew);

            $em->persist($user);
            $em->flush();
            $msg = $user;

        }catch (\Exception $e){

            $msg = 'Se produjo un error al cambiar la contraseña';

        }
        return $msg;

    }

    public function listarUsuarios($user)
    {
        $em = $this->getEntityManager();
        $nivelAccesoID = $user->getNivelAcceso()->getId();
        $nivelAcceso = $user->getNivelAcceso()->getNivel();

        if($nivelAcceso == 'nacional')
        {
            $dql = 'SELECT u FROM AppBundle:Usuario u WHERE u.isActive = TRUE ';
            $query = $em->createQuery($dql);
        }
        elseif($nivelAcceso == 'provincial')
        {
            $provincia = $user->getUnidad()->getMunicipio()->getProvincia()->getCodigo();
            $dql = 'SELECT u FROM AppBundle:Usuario u JOIN u.nivelAcceso n JOIN u.unidad a JOIN a.municipio m JOIN m.provincia p
                    WHERE n.id <= :nivel AND p.codigo = :codigo AND u.isActive = TRUE ';
            $query = $em->createQuery($dql);
            $query->setParameter('nivel' , $nivelAccesoID);
            $query->setParameter('codigo' , $provincia);
        }
        elseif($nivelAcceso == 'municipal')
        {
            $municipio = $user->getUnidad()->getMunicipio()->getCodigo();
            $dql = 'SELECT u FROM AppBundle:Usuario u JOIN u.nivelAcceso n JOIN u.unidad a JOIN a.municipio m
                    WHERE n.id <= :nivel AND m.codigo = :codigo AND u.isActive = TRUE ';
            $query = $em->createQuery($dql);
            $query->setParameter('nivel' , $nivelAccesoID);
            $query->setParameter('codigo' , $municipio);
        }
        else
        {
            $unidad = $user->getUnidad()->getCodigo();
            $dql = 'SELECT u FROM AppBundle:Usuario u JOIN u.nivelAcceso n JOIN u.unidad a
                    WHERE n.id = :nivel AND a.codigo = :codigo AND u.isActive = TRUE ';
            $query = $em->createQuery($dql);
            $query->setParameter('nivel' , $nivelAccesoID);
            $query->setParameter('codigo' , $unidad);
        }
        $usuarios = $query->getResult();

        return $usuarios;
    }

    public function agregarUsuario($data)
    {
        try{
            $em = $this->getEntityManager();
            $user = new Usuario();
            $user->setUsername($data['username']);
            $user->setNombre($data['nombre']);
            $user->setPrimerApellido($data['primerApellido']);
            $user->setSegundoApellido($data['segundoApellido']);

            $nivelAcceso = $em->getRepository('AppBundle:NivelAcceso')->find($data['nivelAcceso']);
            $user->setNivelAcceso($nivelAcceso);

            $unidad = $em->getRepository('AppBundle:Unidad')->find($data['unidad']);
            $user->setUnidad($unidad);

            $encoder = new BCryptPasswordEncoder(12);
            $encoded = $encoder->encodePassword($data['username'],null);
            $user->setPassword($encoded);

            $usuarioRoles = new ArrayCollection();

            foreach( $data['roles'] as $role)
            {
                $usuarioRoles[] = $em->getRepository('AppBundle:Role')->find($role);
            }
            $user->setUsuarioRoles($usuarioRoles);

            $em->persist($user);
            $em->flush();
            $msg = $user;

        }catch (\Exception $e)
        {
            if(strpos($e->getMessage() , 'Duplicate entry') > 0)
            {
                $msg = 'El Usuario ya existe , no se puede agregar';
            }
            else
            {
                $msg = 'Se produjo un error al insertar el Usuario';
            }
        }
        return $msg;
    }

    public function eliminarUsuario($id)
    {
        try
        {
            $em = $this->getEntityManager();
            $user = $em->getRepository('AppBundle:Usuario')->find($id);
            $user->setIsActive(0);

            $em->persist($user);
            $em->flush();
            $msg = $user;

        }catch (\Exception $e){

            $msg = 'Se produjo un error al eliminar el Usuario';

        }
        return $msg;
    }

    public function modificarUsuario($data)
    {
        try
        {
            $em = $this->getEntityManager();
            $user = $em->getRepository('AppBundle:Usuario')->findOneBy(array('username' => $data['username']));

            $user->setNombre($data['nombre']);
            $user->setPrimerApellido($data['primerApellido']);

            $user->setSegundoApellido($data['segundoApellido']);

            $nivelAcceso = $em->getRepository('AppBundle:NivelAcceso')->find($data['nivelAcceso']);
            $user->setNivelAcceso($nivelAcceso);

            $unidad = $em->getRepository('AppBundle:Unidad')->find($data['unidad']);
            $user->setUnidad($unidad);

            $usuarioRoles = new ArrayCollection();

            foreach( $data['roles'] as $role)
            {
                $usuarioRoles[] = $em->getRepository('AppBundle:Role')->findOneBy(array('nombre' => $role));
            }
            $user->setUsuarioRoles($usuarioRoles);

            $em->persist($user);
            $em->flush();
            $msg = $user;

        }catch (\Exception $e)
        {
            $msg = 'Se produjo un error al modificar el Usuario';
        }

        return $msg;
    }
}