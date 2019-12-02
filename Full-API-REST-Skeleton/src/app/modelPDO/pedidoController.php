<?php
namespace App\Models\PDO;
use App\Models\ORM\pedido;
use App\Models\ORM\pedidoDB;
use App\Models\ORM\producto;
use App\Models\ORM\mesa;
use App\Models\IApiControler;

include_once __DIR__ . '../../modelAPI/IApiControler.php';
include_once __DIR__ . '../../modelORM/pedido.php';
include_once __DIR__ . '../../modelORM/producto.php';
include_once __DIR__ . '../../modelORM/pedidoDB.php';
include_once __DIR__ . './mesaController.php';

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class pedidoController implements IApiControler
{
 	public function Bienvenida($request, $response, $args) {
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
       $mesalibre = mesaController::MesaLibre();

       if($mesalibre != null)
       {
         $pedido = new Pedido;
         $mesa = MesaController::MesaLibre();
         $pedido->codigo = $generated = substr(md5(rand()),0,5);
         $pedido->tiempo = $parametros['tiempo'];
         $pedido->mesa = $mesa->codigoMesa;
         $pedido->cliente = $parametros['cliente'];
         $pedido->encargado = $parametros['encargado'];
         $pedido->estadoPedido = 1;
         $pedido->imagen = $this->CrearRutaImagen($archivos["imagen"],"./images/pedido",$pedido->cliente.$pedido->id);;
         $pedido->save(); // Se genera primera parte del pedido en DB

         $productos = $parametros['pedido'];
         $productos = explode(',',$productos);



         if($this->ValidarPedido($productos)) // Busco que existan los productos
         {
           // Genero segunda parte del pedido con sus productos en DB
           for ($i=0; $i < count($productos); $i++) {
             $pedidoDB = new pedidoDB;
             $pedidoDB->pedido = $pedido->id;
             $pedidoDB->producto = $productos[$i];
             $pedidoDB->estado_producto = 2; // Estado PENDIENTE
             $pedidoDB->save();
           }
           $mesa->estado = 1;
           $mesa->save();
           $newResponse = $response->withJson("Pedido: ".$pedido->id." ingresado. "."Codigo: ".$pedido->codigo, 200);
         }
         else {
           $newResponse = $response->withJson('No se encontraron productos', 200);
         }
       }
       else {
         $newResponse = $response->withJson("No hay mesas disponibles", 200);
       }
        return $newResponse;

    }
      public function BorrarUno($request, $response, $args) {
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

    public function CrearRutaImagen($imagen,$ruta,$nombre)
    {
        $tmpName = $imagen->getClientFilename();
        $extension = pathinfo($tmpName, PATHINFO_EXTENSION);
        $filename = $ruta . $nombre .".". $extension;
        $imagen->moveTo($filename);
        return $filename;
    }

    public function ValidarPedido($productos)
    {
      $encontrados = null;

      for ($i=0; $i < count($productos); $i++) {
        $encontrados = Producto::where('id', '=', $productos[$i])->get();
      }

      if(count($encontrados) > 0)
      {
        return true;
      }
      else {
        return false;
      }
    }

}
