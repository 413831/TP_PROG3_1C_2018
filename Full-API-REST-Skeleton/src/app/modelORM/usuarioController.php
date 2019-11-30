<?php
namespace App\Models\ORM;
use App\Models\ORM\usuario;
use App\Models\IApiControler;

include_once __DIR__ . '/usuario.php';
include_once __DIR__ . '../../modelAPI/IApiControler.php';

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class usuarioController implements IApiControler
{
 	  public function Beinvenida($request, $response, $args) {
      $response->getBody()->write("GET => Bienvenido!!! ,a UTN FRA SlimFramework");

    return $response;
    }

    public function TraerTodos($request, $response, $args) {
       	//return cd::all()->toJson();
        $usuarios=usuario::all();
        $newResponse = $response->withJson($usuarios, 200);
        return $newResponse;
    }

    public function TraerUno($request, $response, $args) {
     	//complete el codigo
      $id = $args['id'];
      $usuario = Usuario::find($id);
     	$newResponse = $response->withJson($usuario, 200);
    	return $newResponse;
    }

    public function CargarUno($request, $response, $args) {
   	 //complete el codigo
    $parametros = $request->getParsedBody();
    $usuario = new Usuario;
    $usuario->nombre = $parametros['nombre'];
    $usuario->clave = $parametros['clave'];
    $usuario->rol = $parametros['rol'];
    $usuario->save();
    // Implementar TOKEN

    $newResponse = $response->withJson(Usuario::find($usuario->id), 200);
      return $newResponse;
    }

    public function BorrarUno($request, $response, $args) {
  		//complete el codigo
      $parametros = $request->getParsedBody();
      $id = $args['id'];
      $usuario = Usuario::find($id);
      $usuario->delete();

      $response = json_encode(array('mensaje' => 'Usuario '.$id.' borrado'));      
      return $response;
    }

    public function ModificarUno($request, $response, $args) {
     	//complete el codigo
      $parametros = $request->getParsedBody();
      $id = $args['id'];
      $usuario = Usuario::find($id);
      $usuario->nombre = $parametros['nombre'];
      $usuario->clave = $parametros['clave'];
      $usuario->rol = $parametros['rol'];
      $usuario->save();

      $response = json_encode(array('mensaje' => 'Usuario '.$id.' modificado'));
      return $response;
    }
}
