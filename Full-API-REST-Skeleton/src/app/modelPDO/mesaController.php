<?php
namespace App\Models\PDO;
use App\Models\ORM\mesa;
use App\Models\IApiControler;

include_once __DIR__ . '../../modelORM/usuario.php';
include_once __DIR__ . '../../modelORM/mesa.php';
include_once __DIR__ . '../../modelAPI/IApiControler.php';

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class mesaController implements IApiControler
{
 	  public function Bienvenida($request, $response, $next) {
      $response->getBody()->write("GET => Bienvenido!!! ,a UTN FRA SlimFramework");


    return $response;
    }

    public function TraerTodos($request, $response, $args) {
       	//return cd::all()->toJson();
        $mesas=Mesa::all();
        $newResponse = $response->withJson($mesas, 200);
        return $newResponse;
    }

    public function TraerUno($request, $response, $args) {
     	//complete el codigo
      $id = $args['id'];
      $mesa = Mesa::find($id);
     	$newResponse = $response->withJson($mesa, 200);
    	return $newResponse;
    }

    public function CargarUno($request, $response, $args) {
   	 //complete el codigo
    $parametros = $request->getParsedBody();
    $mesa = new Mesa;
    $mesa->codigoMesa = $parametros['codigo'];
    $mesa->estado = 4;
    $mesa->save();
    // Implementar TOKEN

    $newResponse = $response->withJson(Mesa::find($mesa->id), 200);
      return $newResponse;
    }

    public function BorrarUno($request, $response, $args) {
  		//complete el codigo
      $parametros = $request->getParsedBody();
      $id = $args['id'];
      $mesa = Mesa::find($id);
      $mesa->delete();

      $response = json_encode(array('mensaje' => 'Mesa '.$id.' borrada'));
      return $response;
    }

    public function ModificarUno($request, $response, $args) {
     	//complete el codigo
      $parametros = $request->getParsedBody();
      $id = $args['id'];
      $mesa = Mesa::find($id);
      $mesa->codigoMesa = $parametros['codigo'];
      $mesa->estado = $parametros['estado'];
      $mesa->save();

      $response = json_encode(array('mensaje' => 'Mesa '.$id.' modificada'));
      return $response;
    }

    public function MesaLibre()
   {
       $mesaLibre = Mesa::where("estado", "=", "4")->first();

       if($mesaLibre != null)
       {
           $newResponse = $mesaLibre; // Clientes en espera
       }
       else
       {
           $newResponse = null;
       }
       return $newResponse;
   }
}
