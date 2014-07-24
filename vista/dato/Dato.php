<?php
/**
*@package pXP
*@file gen-Dato.php
*@author  (admin)
*@date 22-07-2014 01:58:52
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Dato=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
    	Phx.vista.Dato.superclass.constructor.call(this,config);


		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_dato'
			},
			type:'Field',
			form:true 
		},
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_tipo_dato'
			},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'formula',
				fieldLabel: 'Formula',
				allowBlank: true,
				anchor: '80%',
				gwidth: 250,
				maxLength:500
			},
				type:'TextField',
				filters:{pfiltro:'dato.formula',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config:{
				name: 'estado_reg',
				fieldLabel: 'Estado Reg.',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:10
			},
				type:'TextField',
				filters:{pfiltro:'dato.estado_reg',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'fecha_reg',
				fieldLabel: 'Fecha creación',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y H:i:s'):''}
			},
				type:'DateField',
				filters:{pfiltro:'dato.fecha_reg',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'usr_reg',
				fieldLabel: 'Creado por',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'NumberField',
				filters:{pfiltro:'usu1.cuenta',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'fecha_mod',
				fieldLabel: 'Fecha Modif.',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y H:i:s'):''}
			},
				type:'DateField',
				filters:{pfiltro:'dato.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'usr_mod',
				fieldLabel: 'Modificado por',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'NumberField',
				filters:{pfiltro:'usu2.cuenta',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'orden_ejecucion',
				fieldLabel: 'Orden Ejecucion',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'NumberField',
				filters:{pfiltro:'dato.orden_ejecucion',type:'string'},
				id_grupo:1,
				grid:true,
				form:true
		}
	],
	tam_pag:50,	
	title:'Dato',
	ActSave:'../../sis_gerencial/control/Dato/insertarDato',
	ActDel:'../../sis_gerencial/control/Dato/eliminarDato',
	ActList:'../../sis_gerencial/control/Dato/listarDato',
	id_store:'id_dato',
	fields: [
		{name:'id_dato', type: 'numeric'},
		{name:'id_tipo_dato', type: 'numeric'},
		{name:'formula', type: 'string'},
		{name:'estado_reg', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'nombre', type: 'string'},
		{name:'orden_ejecucion', type: 'numeric'},
	],
	sortInfo:{
		field: 'id_dato',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,

	onSubmit:function(o){
	 this.Cmp.formula.setValue(encodeURIComponent(this.Cmp.formula.getValue()));
	  Phx.vista.Dato.superclass.onSubmit.call(this,o);
	},
    onReloadPage:function(m){
		this.maestro=m;			
		this.getBoton('act').enable();	
		this.load({params:{start:0, limit:this.tam_pag,id_tipo_dato:this.maestro.id_tipo_dato}});			
	},
	loadValoresIniciales:function()
    {
        this.Cmp.id_tipo_dato.setValue(this.maestro.id_tipo_dato);       
        Phx.vista.Dato.superclass.loadValoresIniciales.call(this);
    },
    

	
	}
)
</script>
		
		