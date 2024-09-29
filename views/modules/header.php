<div class="w-full h-16 flex justify-between items-center bg-blue-500 border-b-2 border-gray-200">
    
    <div class="pl-2 pt-2">
        <?php
            include 'views/modules/n2.php';
        ?>
    </div>

    <div class="w-[85px] h-[85px]">
            <img src="views/images/logo.png" alt="logo-vitalclinic">
        </div>

    <div class="text-black pr-2 pt-2 flex gap-x-1 text-white text-sm">
        <p class="text-white">
            <?php 
                echo $_SESSION['user']['name'] . ' '. $_SESSION['user']['lastname'];
            ?>
        </p>

        <div class="cursor-pointer hover:border-b-2 flex gap-x-1">
            
            <div class="w-6 h-6">
                <img src="views/images/cerrar-sesion-de-usuario.png" alt="cerrar-session">
            </div>

            <a href="#" class="text-white">Cerrar Sesión</a>
        </div>
    </div>
    
</div>