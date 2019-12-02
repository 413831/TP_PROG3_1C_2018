<?php
namespace App\Models\ORM;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class ticket extends \Illuminate\Database\Eloquent\Model {
  // protected $fillable = ['rol', 'nombre', 'clave'];
  protected $cliente;
  protected $mesa;
  protected $codigo;
  protected $detalle;
  protected $importe;

}
