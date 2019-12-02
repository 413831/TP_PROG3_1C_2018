<?php
namespace App\Models\PDO;
use App\Models\ORM\mesa;
use App\Models\ORM\usuario;
use App\Models\ORM\ticket;
use App\Models\ORM\producto;
use App\Models\IApiControler;
use App\Models\ORM\pedido;
use App\Models\ORM\pedidoDB;

include_once __DIR__ . '../../modelORM/usuario.php';
include_once __DIR__ . '../../modelORM/mesa.php';
include_once __DIR__ . '../../modelORM/producto.php';
include_once __DIR__ . '../../modelORM/pedido.php';
include_once __DIR__ . '../../modelORM/ticket.php';
include_once __DIR__ . '../../modelORM/pedidoDB.php';
include_once __DIR__ . '../../modelAPI/IApiControler.php';

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class MainController
{
 	  public function Bienvenida($request, $response, $next) {
      $response->getBody()->write("GET => Bienvenido!!! ,a UTN FRA SlimFramework");

    return $response;
    }

    public function ListarPedidos($request, $response, $args)
      {
          $rol = 5; // HARDCODE PARA TOKEN ADMIN

          if($rol == 5) // Rol SOCIO
          {
              $pedidos = PedidoDB::join('pedidos','pedidos_productos.pedido','pedidos.id')
                                    ->join('estado_pedido','pedidos.estadoPedido','estado_pedido.id')
                                    ->join('usuarios','pedidos.encargado','usuarios.id')
                                    ->select('pedidos_productos.pedido','estado_pedido.estado','usuarios.nombre AS encargado',
                                            'pedidos.mesa','pedidos.cliente')
                                    ->distinct('pedidos.id')
                                    ->get();
            $newResponse = $response->withJson($pedidos, 200);
          }
          else {
              $newResponse = json_encode(array('mensaje' => "Accion no permitida."));
          }
          return $newResponse;
      }

      public function DetallePedido($request, $response, $args)
        {
            $parametros = $request->getParsedBody();
            $idPedido = $args['pedido'];
             // $query = [['usuarios.id', '=' , $idUsuario],['pedidos.id', '=' , $idPedido]
            $pedidos = PedidoDB::where('pedidos_productos.pedido', '=' , $idPedido)
                                    ->join('pedidos','pedidos_productos.pedido','pedidos.id')
                                    ->join('productos','pedidos_productos.producto','productos.id')
                                    ->join('usuarios','pedidos.encargado','usuarios.id')
                                  ->join('estado_pedido','pedidos.estadoPedido','estado_pedido.id')
                                  ->join('estado_producto','productos.estado','estado_producto.id')
                                  ->join('roles','productos.tipo','roles.id')
                                  ->select('pedidos_productos.pedido','estado_pedido.estado AS estado pedido',
                                            'usuarios.nombre AS encargado','pedidos.mesa','pedidos.cliente','productos.descripcion',
                                            'roles.rol AS sector','estado_producto.estado AS estado producto')
                                      ->distinct('pedidos_productos.pedido')
                                    ->get();

            $newResponse = $response->withJson($pedidos, 200);

            return $newResponse;
        }

        public function ListarPendientes($request, $response, $args)
          {
              $idEncargado = $args['id'];
              $estadoPedido = "en preparacion";
              $encargado = Usuario::find($idEncargado);

              $query = [['pedidos.encargado', '=' , $idEncargado],['estado_pedido.estado', '=' , $estadoPedido]];
              $pedidos = PedidoDB::where($query)
                                      ->join('pedidos','pedidos_productos.pedido','pedidos.id')
                                      ->join('usuarios','pedidos.encargado','usuarios.id')
                                      ->join('estado_pedido','pedidos.estadoPedido','estado_pedido.id')
                                      ->select('pedidos.id AS pedido','pedidos.cliente','estado_pedido.estado AS estado pedido',
                                      'pedidos.mesa','pedidos.tiempo','usuarios.nombre AS encargado')
                                      ->distinct('pedidos_productos.pedido')
                                      ->get();

              $newResponse = $response->withJson($pedidos, 200);

              return $newResponse;
          }

          public function CerrarPendiente($request, $response, $args)
          {
              $parametros = $request->getParsedBody();
              $idEncargado =  $parametros['id'];
              $idPedido =  $parametros['pedido'];
              $encargado = Usuario::find($idEncargado);

              $query = [['pedidos_productos.estado_producto', '=' , 1],['pedidos.id', '=' , $idPedido],
                            ['productos.tipo', '=' , $encargado->rol]];
              $pedidos = Producto::where($query)
                                    ->join('pedidos_productos','productos.id','pedidos_productos.producto')
                                  ->join('pedidos','pedidos_productos.pedido','pedidos.id')
                                  ->join('estado_producto','pedidos_productos.estado_producto','estado_producto.id')
                                  ->join('roles','productos.tipo','roles.id')
                                  ->select('pedidos.id AS pedido','pedidos.mesa','pedidos.tiempo',
                                  'productos.descripcion','roles.rol AS sector','estado_producto.estado AS estado')
                                  ->update(['pedidos_productos.estado_producto' => 3]);
              // $productoListo = PedidoDB::where(['pedidos_productos.estado_producto' => 3],
              //                                   ['pedidos_productos.estado_producto' => 3]);

              $newResponse = $response->withJson("Pedido cerrado", 200);
              return $newResponse;
          }

          public function CobrarMesa($request, $response, $args)
          {
              $idMesa =  $args['mesa'];
              $mesa = Mesa::find($idMesa);
              $importeTotal = 0;
              // Post::sum('views');

              $productos = Producto::where("codigoMesa", "=", $idMesa)
                                    ->join('pedidos_productos','productos.id','pedidos_productos.producto')
                                    ->join('pedidos','pedidos_productos.pedido','pedidos.id')
                                    ->join('mesas','pedidos.mesa','mesas.codigoMesa')
                                    ->join('usuarios','pedidos.encargado','usuarios.id')
                                    ->select('mesas.codigoMesa','pedidos.codigo','pedidos.id AS pedido','pedidos.cliente',
                                            'productos.descripcion','productos.precio')
                                    ->get();
            $ticket = new Ticket;
            $ticket->mesa = $idMesa;
            $ticket->cliente = $productos[0]->cliente;
            $ticket->codigo = $productos[0]->codigo;

            for ($i=0; $i < count($productos); $i++) {
                $ticket->detalle .= $productos[$i]->descripcion . " - $ " . (int)$productos[$i]->precio . " / ";
                $importeTotal += (int)$productos[$i]->precio;
            }
            $ticket->importe = $importeTotal;
            $ticket->save();
              $newResponse = $response->withJson( $ticket , 200);
              return $newResponse;
          }
}
