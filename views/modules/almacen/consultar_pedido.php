<?php 
    include "./controllers/control_privilegios.php";
    $privilegio = "consultar_pedido";
    $control_privilegios = new ControlPrivilegios();
    $acceso = $control_privilegios->verificar_privilegios($privilegio);
?> 

<div class="w-full h-screen">
    <?php
        include 'views/modules/header.php';
    ?>
    
    <div class="w-full mt-4 flex flex-col gap-y-4">
        <form class="flex items-center w-96 border-2 border-gray-200 rounded-md bg-blue-500 py-2">
            <label for="cedula" class="w-full relative px-6">
                <p class="text-white text-sm">Consultar Número de Pedido:</p>
                <input 
                    type="text" 
                    name="cod_pedido" 
                    id="cod_pedido"
                    class="w-full border-2 border-gray-300 rounded-md p-2 pt-2 my-1 font-extralight text-black-500 font-medium text-base focus:outline-none"
                >
            </label>
            <label for="" class="w-fit pr-4">
                <input 
                    type="submit" 
                    value="Consultar" 
                    class="w-fit border-2 border-gray-300 rounded-md px-4 font-extralight text-white text-base font-medium focus:outline-none cursor-pointer bg-blue-600 hover:border-purple-500"
                >
            </label>
        </form>

        <table class="w-full table-auto border-2 border-red-500">
            <thead class="text-sm text-white">
                <tr>
                    <th>N° Pedido</th>
                    <th>Ruta</th>
                    <th>C. Unidades</th>
                    <th>Despachador</th>
                    <th>Rechequeador</th>
                    <th>Embalador</th>
                    <th>Entregado por</th>
                    <th>Fecha de entrega</th>
                    <th>Fecha de rechequeo</th>
                    <th>Errores detectados</th>
                </tr>
            </thead>
            <tbody id="body_table"></tbody>
        </table>
    </div>
</div>

<template id="template_body_table">
    <tr>
        <td class="cod_pedido"></td>
        <td class="ruta"></td>
        <td class="unidades"></td>
        <td class="despachador"></td>
        <td class="rechequeador"></td>
        <td class="embalador"></td>
        <td class="entregado_por"></td>
        <td class="fecha_entrega"></td>
        <td class="fecha_rechequeo"></td>
        <td class="errores"></td>
    </tr>
</template>