<?php
namespace App\Models\ORM;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class usuario extends \Illuminate\Database\Eloquent\Model {
  // protected $fillable = ['rol', 'nombre', 'clave'];
  protected $rol;
  protected $nombre;
  protected $clave;
  protected $id;

}
