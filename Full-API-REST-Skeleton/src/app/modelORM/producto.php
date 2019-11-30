<?php
namespace App\Models\ORM;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class producto extends \Illuminate\Database\Eloquent\Model {
  protected $descripcion;
  protected $precio;
  protected $tipo;

}
