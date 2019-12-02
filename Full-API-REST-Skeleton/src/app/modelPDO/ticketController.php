<?php
namespace App\Models\PDO;
use App\Models\ORM\ticket;
use App\Models\ORM\mesa;
use App\Models\ORM\pedido;
use App\Models\IApiControler;

include_once __DIR__ . '../../modelORM/ticket.php';
include_once __DIR__ . '../../modelORM/mesa.php';
include_once __DIR__ . '../../modelORM/pedido.php';
include_once __DIR__ . '../../modelAPI/IApiControler.php';

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class ticketController implements IApiControler
{
 	  public function Bienvenida($request, $response, $next) {
      $response->getBody()->write("GET => Bienvenido!!! ,a UTN FRA SlimFramework");


    return $response;
    }

    public function TraerTodos($request, $response, $args) {
       	//return cd::all()->toJson();
        $tickets=Ticket::all();
        $newResponse = $response->withJson($tickets, 200);
        return $newResponse;
    }

    public function TraerUno($request, $response, $args) {
     	//complete el codigo
      $id = $args['id'];
      $ticket = Ticket::find($id);
     	$newResponse = $response->withJson($ticket, 200);
    	return $newResponse;
    }

    public function CargarUno($request, $response, $args) {
   	 //complete el codigo
    $parametros = $request->getParsedBody();
    $ticket = new Ticket;
    $ticket->pedido = $parametros['codigo'];
    $ticket->importe = $parametros['estado'];
    $ticket->save();
    // Implementar TOKEN

    $newResponse = $response->withJson(Ticket::find($ticket->id), 200);
      return $newResponse;
    }

    public function BorrarUno($request, $response, $args) {
  		//complete el codigo
      $parametros = $request->getParsedBody();
      $id = $args['id'];
      $ticket = Ticket::find($id);
      $ticket->delete();

      $response = json_encode(array('mensaje' => 'Ticket '.$id.' borrado'));
      return $response;
    }

    public function ModificarUno($request, $response, $args) {
     	//complete el codigo
      $parametros = $request->getParsedBody();
      $id = $args['id'];
      $ticket = Ticket::find($id);
      $ticket->codigoMesa = $parametros['codigo'];
      $ticket->estado = $parametros['estado'];
      $ticket->save();

      $response = json_encode(array('mensaje' => 'Ticket '.$id.' modificado'));
      return $response;
    }


}
