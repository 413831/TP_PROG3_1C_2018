<?php

use Slim\App;
use Slim\Http\Request;
use Slim\Http\Response;
use App\Models\ORM\producto;
use App\Models\ORM\usuario;
use App\Models\ORM\pedido;
use App\Models\ORM\mesa;
use App\Models\ORM\usuarioController;
use App\Models\ORM\productoController;
use App\Models\ORM\pedidoController;

include_once __DIR__ . '/../../src/app/modelORM/usuario.php';
include_once __DIR__ . '/../../src/app/modelORM/producto.php';
include_once __DIR__ . '/../../src/app/modelORM/pedido.php';
include_once __DIR__ . '/../../src/app/modelORM/mesa.php';
include_once __DIR__ . '/../../src/app/modelORM/producto.php';
include_once __DIR__ . '/../../src/app/modelORM/usuarioController.php';
include_once __DIR__ . '/../../src/app/modelORM/pedidoController.php';
include_once __DIR__ . '/../../src/app/modelORM/productoController.php';

return function (App $app) {
    $container = $app->getContainer();

    $app->group('/usuarios', function () {
         //$this->get('/',cdControler::class . ':TraerTodos');
        $this->get('/',usuarioController::class . ':TraerTodos');
        $this->get('/{id}',usuarioController::class . ':TraerUno');
        $this->post('/',usuarioController::class . ':CargarUno');
        $this->delete('/{id}',usuarioController::class . ':BorrarUno');
        $this->put('/{id}',usuarioController::class . ':ModificarUno');
    });

    $app->group('/productos', function () {
        //$this->get('/',cdControler::class . ':TraerTodos');
       $this->get('/',productoController::class . ':TraerTodos');
       $this->get('/{id}',productoController::class . ':TraerUno');
       $this->post('/',productoController::class . ':CargarUno');
       $this->delete('/{id}',productoController::class . ':BorrarUno');
       $this->put('/{id}',productoController::class . ':ModificarUno');
   });

   $app->group('/pedidos', function () {
       //$this->get('/',cdControler::class . ':TraerTodos');
      $this->get('/',pedidoController::class . ':TraerTodos');
      $this->get('/{id}',pedidoController::class . ':TraerUno');
      $this->post('/',pedidoController::class . ':CargarUno');
      $this->delete('/{id}',pedidoController::class . ':BorrarUno');
      $this->put('/{id}',pedidoController::class . ':ModificarUno');
  });


};
