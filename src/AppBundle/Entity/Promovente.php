<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Promovente
 *
 * @ORM\Table(name="promovente")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\PromoventeRepository")
 * @ORM\HasLifecycleCallbacks()
 */
class Promovente
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nombre", type="string", length=255)
     */
    private $nombre;

    /**
     * @var string
     *
     * @ORM\Column(name="primerApellido", type="string", length=100, nullable=true)
     */
    private $primerApellido;

    /**
     * @var string
     *
     * @ORM\Column(name="segundoApellido", type="string", length=100, nullable=true)
     */
    private $segundoApellido;

    /**
     * @var string
     *
     * @ORM\Column(name="carnetIdentidad", type="string", length=11, nullable=true)
     */
    private $carnetIdentidad;

    /**
     * @var string
     *
     * @ORM\Column(name="fonNombre", type="string", length=255)
     */
    private $fonNombre;

    /**
     * @var string
     *
     * @ORM\Column(name="fonPrimerApellido", type="string", length=100)
     */
    private $fonPrimerApellido;

    /**
     * @var string
     *
     * @ORM\Column(name="fonSegundoApellido", type="string", length=100)
     */
    private $fonSegundoApellido;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\CodMunicipio",inversedBy="promoventes")
     */
    protected $municipio;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\CodCategoriaPromovente",inversedBy="promoventes")
     */
    protected $categoria;


    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set nombre
     *
     * @param string $nombre
     *
     * @return Promovente
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * Get nombre
     *
     * @return string
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * Set primerApellido
     *
     * @param string $primerApellido
     *
     * @return Promovente
     */
    public function setPrimerApellido($primerApellido)
    {
        $this->primerApellido = $primerApellido;

        return $this;
    }

    /**
     * Get primerApellido
     *
     * @return string
     */
    public function getPrimerApellido()
    {
        return $this->primerApellido;
    }

    /**
     * Set segundoApellido
     *
     * @param string $segundoApellido
     *
     * @return Promovente
     */
    public function setSegundoApellido($segundoApellido)
    {
        $this->segundoApellido = $segundoApellido;

        return $this;
    }

    /**
     * Get segundoApellido
     *
     * @return string
     */
    public function getSegundoApellido()
    {
        return $this->segundoApellido;
    }

    /**
     * Set carnetIdentidad
     *
     * @param string $carnetIdentidad
     *
     * @return Promovente
     */
    public function setCarnetIdentidad($carnetIdentidad)
    {
        $this->carnetIdentidad = $carnetIdentidad;

        return $this;
    }

    /**
     * Get carnetIdentidad
     *
     * @return string
     */
    public function getCarnetIdentidad()
    {
        return $this->carnetIdentidad;
    }

    /**
     * @ORM\PrePersist
     * @ORM\PreUpdate
     */
    public function setFonNombreValue()
    {
        $this->fonNombre = metaphone($this->nombre,5);
    }

    /**
     * @ORM\PrePersist
     * @ORM\PreUpdate
     */
    public function setFonPrimerApellidoValue()
    {
        $this->fonPrimerApellido = metaphone($this->primerApellido,5);
    }

    /**
     * @ORM\PrePersist
     * @ORM\PreUpdate
     */
    public function setFonSegundoApellidoValue()
    {
        $this->fonSegundoApellido = metaphone($this->segundoApellido,5);
    }

    /**
     * Set fonNombre
     *
     * @param string $fonNombre
     *
     * @return Promovente
     */
    public function setFonNombre($fonNombre)
    {
        $this->fonNombre = $fonNombre;

        return $this;
    }

    /**
     * Get fonNombre
     *
     * @return string
     */
    public function getFonNombre()
    {
        return $this->fonNombre;
    }

    /**
     * Set fonPrimerApellido
     *
     * @param string $fonPrimerApellido
     *
     * @return Promovente
     */
    public function setFonPrimerApellido($fonPrimerApellido)
    {
        $this->fonPrimerApellido = $fonPrimerApellido;

        return $this;
    }

    /**
     * Get fonPrimerApellido
     *
     * @return string
     */
    public function getFonPrimerApellido()
    {
        return $this->fonPrimerApellido;
    }

    /**
     * Set fonSegundoApellido
     *
     * @param string $fonSegundoApellido
     *
     * @return Promovente
     */
    public function setFonSegundoApellido($fonSegundoApellido)
    {
        $this->fonSegundoApellido = $fonSegundoApellido;

        return $this;
    }

    /**
     * Get fonSegundoApellido
     *
     * @return string
     */
    public function getFonSegundoApellido()
    {
        return $this->fonSegundoApellido;
    }

    /**
     * Set municipio
     *
     * @param \AppBundle\Entity\CodMunicipio $municipio
     *
     * @return Promovente
     */
    public function setMunicipio(\AppBundle\Entity\CodMunicipio $municipio = null)
    {
        $this->municipio = $municipio;

        return $this;
    }

    /**
     * Get municipio
     *
     * @return \AppBundle\Entity\CodMunicipio
     */
    public function getMunicipio()
    {
        return $this->municipio;
    }

    /**
     * Set categoria
     *
     * @param \AppBundle\Entity\CodCategoriaPromovente $categoria
     *
     * @return Promovente
     */
    public function setCategoria(\AppBundle\Entity\CodCategoriaPromovente $categoria = null)
    {
        $this->categoria = $categoria;

        return $this;
    }

    /**
     * Get categoria
     *
     * @return \AppBundle\Entity\CodCategoriaPromovente
     */
    public function getCategoria()
    {
        return $this->categoria;
    }
}
