<?php
namespace App\Models\ORM;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class pedido extends \Illuminate\Database\Eloquent\Model {
  protected $estadoPedido;
  protected $tiempo;
  protected $mesa;
  protected $cliente;
  protected $encargado;

}
