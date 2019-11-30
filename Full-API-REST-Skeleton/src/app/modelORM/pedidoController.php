<?php
namespace App\Models\ORM;
use App\Models\ORM\pedido;
use App\Models\ORM\pedidoDB;
use App\Models\IApiControler;

include_once __DIR__ . '/pedido.php';
include_once __DIR__ . '/pedidoDB.php';
include_once __DIR__ . '../../modelAPI/IApiControler.php';

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class pedidoController implements IApiControler
{
 	public function Beinvenida($request, $response, $args) {
      $response->getBody()->write("GET => Bienvenido!!! ,a UTN FRA SlimFramework");

    return $response;
    }

     public function TraerTodos($request, $response, $args) {
       	//return cd::all()->toJson();
        $pedidos = pedido::all();
        $newResponse = $response->withJson($pedidos, 200);
        return $newResponse;
    }
    public function TraerUno($request, $response, $args) {
     	//complete el codigo
      $id = $args['id'];
      $pedido = Pedido::find($id);
     	$newResponse = $response->withJson($pedido, 200);
    	return $newResponse;
    }

      public function CargarUno($request, $response, $args) {
     	 //complete el codigo
       $parametros = $request->getParsedBody();
       $archivos = $request->getUploadedFiles();
       
       $pedido = new Pedido;
       $pedido->tiempo = $parametros['tiempo'];
       $pedido->mesa = $parametros['mesa'];
       $pedido->cliente = $parametros['cliente'];
       $pedido->encargado = $parametros['encargado'];
       $pedido->estadoPedido = $parametros['estadoPedido'];
       $pedido->save();

       $productos = $parametros['pedido'];
       $productos = explode(',',$productos);
       $pedido->id;

       for ($i=0; $i < count($productos); $i++) {
         $pedidoDB = new pedidoDB;
         $pedidoDB->pedido = $pedido->id;
         $pedidoDB->producto = $productos[$i];
         $pedidoDB->save();
       }

     	 $newResponse = $response->withJson("Pedido ".$pedido->id ." ingresado." , 200);
        return $newResponse;
    }
      public function BorrarUno($request, $response, $args) {
  		//complete el codigo
      $parametros = $request->getParsedBody();
      $id = $args['id'];
      $pedido = Pedido::find($id);
      $pedido->delete();
      PedidoDB::where('pedido', '=', $id)->delete();

     	$newResponse = $response->withJson("Pedido borrado", 200);
      	return $newResponse;
    }

     public function ModificarUno($request, $response, $args) {
     	//complete el codigo
     	$newResponse = $response->withJson("sin completar", 200);
		    return 	$newResponse;
    }



}
