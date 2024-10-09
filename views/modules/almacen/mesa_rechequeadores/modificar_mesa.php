<?php 
    include "./controllers/control_privilegios.php";
    $privilegio = "asignar_mesa";
    $control_privilegios = new ControlPrivilegios();
    $acceso = $control_privilegios->verificar_privilegios($privilegio);
?> 

<div class="w-full">
    <?php
        include 'views/modules/header.php';
    ?>

    <div class="md:w-[70%] flex flex-col gap-y-4 mx-auto mt-4 lg:w-[60%]">

        <div class="mx-auto w-[30%] border-2 border-gray-300 bg-blue-500 flex rounded-md">
            <div class="py-2 w-full text-center border-r-2 border-gray-400 bg-gray-200 hover:bg-gray-300 font-medium" id="t_d">Turno Mañana</div>
            <div class="py-2 w-full text-center bg-gray-200 hover:bg-gray-300 font-medium" id="t_t">Turno Tarde</div>
        </div>

        <div class="w-full h-[600px] border-2 border-gray-300 rounded-md bg-gray-100 overflow-y-auto relative">
            <table class="w-full h-600 table-auto border-separate border border-slate-400 rounded-md">
                <thead class="sticky top-0 z-10">
                    <th class="border-2 border-black-500 text-white bg-gray-400 w-24">N° Mesa</th>
                    <th class="border-2 border-black-500 text-white bg-gray-400 w-96">Rechequeador</th>
                    <th class="border-2 border-black-500 text-white bg-gray-400">Embalador</th>
                    <th class="border-2 border-black-500 text-white bg-gray-400 w-32">Modificar</th>
                </thead>
                <tbody id="body_table_mesa">
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">1</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">2</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">3</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">4</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">5</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">6</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">7</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">8</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">9</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">10</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">11</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">12</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">13</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">14</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">15</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">16</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">17</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">18</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">19</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                    <tr class="hover:bg-gray-200">
                        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">20</td>
                        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"></td>
                        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium">Editar</button></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
<div>

<template id="template_body_table_mesa">
    <tr class="hover:bg-gray-200">
        <td class="n_mesa border-2 border-black-500 text-black text-center font-medium">1</td>
        <td class="rechequeador border-2 border-black-500 text-black text-center"></td>
        <td class="embalador border-2 border-black-500 text-black text-center"></td>
        <td class="embalador border-2 border-black-500 text-black text-center"><button class="border-2 border-gray-200 bg-blue-400 px-6 py-[1px] hover:bg-blue-500 rounded-md text-white font-medium edit">Editar</button></td>
    </tr>
    </tr>
</template>

<script src="./views/assets/js/api.js"></script>
<script src="./views/assets/js/almacen/rechequeo/mesa_rechequeo.js" type="module"></script>