

<?php 
foreach($arrRegistros as $arrRegistro) {     
?>
						
    <div class="card container" >
    
        <a class="card-link" href="/busquedas/<?=Funciones::depuraurl($arrRegistro[1]);?>">

            <div class="card-title">

                <div class="title">
                    <h2><?=$arrRegistro[1];?> (<?=$arrRegistro[2];?>)</h2>
                    <h3><i class="far fa-clock fa-sm"></i> <?=$arrRegistro[3];?> </h3>
                </div>

            </div>

        </a> 

    </div>

<?php } ?>