<?php
namespace App\Models\ORM;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class pedidoDB extends \Illuminate\Database\Eloquent\Model {
  protected $pedido;
  protected $producto;
  protected $table = 'pedidos_productos';

}
