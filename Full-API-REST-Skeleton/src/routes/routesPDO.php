<?php

use Slim\App;
use Slim\Http\Request;
use Slim\Http\Response;
use App\Models\PDO\AccesoDatos;
use App\Models\PDO\MainController;

include_once __DIR__ . '/../../src/app/modelPDO/AccesoDatos.php';
include_once __DIR__ . '/../../src/app/modelPDO/MainController.php';

return function (App $app) {
    $container = $app->getContainer();

    $app->group('/PDO', function () {

        $this->get('/',MainController::class.':ListarPedidos');
        $this->get('/{id}',MainController::class.':ListarPendientes');
        $this->post('/{pedido}',MainController::class.':DetallePedido');
        $this->put('/',MainController::class.':CerrarPendiente');
        $this->put('/{mesa}',MainController::class.':CobrarMesa');
    });


};
