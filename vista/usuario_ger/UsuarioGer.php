<?php
/**
*@package pXP
*@file gen-SistemaDist.php
*@author  (fprudencio)
*@date 20-09-2011 10:22:05
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/
header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.UsuarioGer = {
	require:'../../../sis_seguridad/vista/usuario/Usuario.php',
	
	requireclase:'Phx.vista.usuario',
	title:'Administracion Usr',
	nombreVista: 'UsuarioGer',
	bnew:true,
	bedit:false,
	bdel:false,
	bsave:false,
	constructor: function(config) {	
		this.maestro=config.maestro;
		/*	this.cmbProcesoMacro.store.load({params:{start:0,limit:this.tam_pag,codigo_proceso:'SOPTE'}, 
		       callback : function (r) {
		       		if (r.length == 1 ) {	       				
		    			this.cmbProcesoMacro.setValue(r[0].data.id_proceso_macro);
		    			this.cmbProcesoMacro.fireEvent('select');
		    		} else {
		    			alert('No se ha definido un flujo para HelpDesk');
		    		}   
		    			    		
		    	}, scope : this
		    });
		    this.cmbProcesoMacro.setDisabled(true);
    		this.initButtons=[this.cmbProcesoMacro];*/
    		Phx.vista.UsuarioGer.superclass.constructor.call(this,config);
    		//this.getBoton('btnChequeoDocumentosWf').setText('Archivos del Problema');
    		//this.getBoton('btnChequeoDocumentosWf').setTooltip('Subir imágenes o archivos del problema');					
    },
	     
    
     iniciarEventos:function(){
          
       /*   this.cmpTipoProceso=this.getComponente('id_tipo_proceso');
          
          this.cmpTipoIni=this.getComponente('tipo_ini');
          
          this.cmpIdPersona=this.getComponente('id_persona');
          this.cmpIdInstitucion=this.getComponente('id_institucion');
          
        
         this.cmpTipoIni.on('change',function(groupRadio,radio){
                        if(radio.inputValue){
                            this.enableDisable(radio.inputValue);
                        }
                    },this); */
                    
    },    
     
    enableDisable:function(val){
    /*  if(val =='institucion'){
            
            this.cmpIdPersona.disable();
            this.cmpIdPersona.reset()
            this.cmpIdInstitucion.enable();
            this.cmpIdPersona.setVisible(false);
            this.cmpIdInstitucion.setVisible(true);
        }
        else{
            this.cmpIdPersona.enable();
            this.cmpIdInstitucion.disable();
            this.cmpIdInstitucion.reset();
            this.cmpIdPersona.setVisible(true);
            this.cmpIdInstitucion.setVisible(false);
            
         }*/
         
     },
     filtraAddEdit:function(){
      /*  this.cmpTipoProceso.store.baseParams.id_proceso_macro=this.cmbProcesoMacro.getValue();
        this.cmpTipoProceso.modificado=true;*/
            
        
    },
    
    tabeast:[
             
            {
                    url:'../../../sis_seguridad/vista/usuario_rol/UsuarioRol.php',
                    title:'Roles', 
                    width:400,
                    cls:'usuario_rol'
            },
            {
                url:'../../../sis_gerencial/vista/usuario_filial/UsuarioFilial.php',
                title:'Filiales', 
                width:400,
                cls:'UsuarioFilial'
            }
             ]
    
    
};
</script>
