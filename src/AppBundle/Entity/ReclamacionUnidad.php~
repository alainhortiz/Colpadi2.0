<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ReclamacionUnidad
 *
 * @ORM\Table(name="reclamacion_unidad")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ReclamacionUnidadRepository")
 */
class ReclamacionUnidad
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
     * @var \DateTime
     *
     * @ORM\Column(name="fechaEntrada", type="datetime", nullable=true)
     */
    private $fechaEntrada;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fechaRespuesta", type="datetime", nullable=true)
     */
    private $fechaRespuesta;

    /**
     * @var string
     *
     * @ORM\Column(name="gestion", type="text", nullable=true)
     */
    private $gestion;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\CodConceptoReclamacion",inversedBy="reclamacionUnidades")
     */
    protected $concepto;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\CodReclamacionLugar",inversedBy="reclamacionUnidades")
     */
    protected $lugar;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Reclamacion",inversedBy="reclamacionUnidades")
     */
    protected $reclamacion;


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
     * Set fechaEntrada
     *
     * @param \DateTime $fechaEntrada
     *
     * @return ReclamacionUnidad
     */
    public function setFechaEntrada($fechaEntrada)
    {
        $this->fechaEntrada = $fechaEntrada;

        return $this;
    }

    /**
     * Get fechaEntrada
     *
     * @return \DateTime
     */
    public function getFechaEntrada()
    {
        return $this->fechaEntrada;
    }

    /**
     * Set fechaRespuesta
     *
     * @param \DateTime $fechaRespuesta
     *
     * @return ReclamacionUnidad
     */
    public function setFechaRespuesta($fechaRespuesta)
    {
        $this->fechaRespuesta = $fechaRespuesta;

        return $this;
    }

    /**
     * Get fechaRespuesta
     *
     * @return \DateTime
     */
    public function getFechaRespuesta()
    {
        return $this->fechaRespuesta;
    }

    /**
     * Set gestion
     *
     * @param string $gestion
     *
     * @return ReclamacionUnidad
     */
    public function setGestion($gestion)
    {
        $this->gestion = $gestion;

        return $this;
    }

    /**
     * Get gestion
     *
     * @return string
     */
    public function getGestion()
    {
        return $this->gestion;
    }

    /**
     * Set concepto
     *
     * @param \AppBundle\Entity\CodConceptoReclamacion $concepto
     *
     * @return ReclamacionUnidad
     */
    public function setConcepto(\AppBundle\Entity\CodConceptoReclamacion $concepto = null)
    {
        $this->concepto = $concepto;

        return $this;
    }

    /**
     * Get concepto
     *
     * @return \AppBundle\Entity\CodConceptoReclamacion
     */
    public function getConcepto()
    {
        return $this->concepto;
    }

    /**
     * Set lugar
     *
     * @param \AppBundle\Entity\CodReclamacionLugar $lugar
     *
     * @return ReclamacionUnidad
     */
    public function setLugar(\AppBundle\Entity\CodReclamacionLugar $lugar = null)
    {
        $this->lugar = $lugar;

        return $this;
    }

    /**
     * Get lugar
     *
     * @return \AppBundle\Entity\CodReclamacionLugar
     */
    public function getLugar()
    {
        return $this->lugar;
    }

    /**
     * Set reclamacion
     *
     * @param \AppBundle\Entity\Reclamacion $reclamacion
     *
     * @return ReclamacionUnidad
     */
    public function setReclamacion(\AppBundle\Entity\Reclamacion $reclamacion = null)
    {
        $this->reclamacion = $reclamacion;

        return $this;
    }

    /**
     * Get reclamacion
     *
     * @return \AppBundle\Entity\Reclamacion
     */
    public function getReclamacion()
    {
        return $this->reclamacion;
    }
}
