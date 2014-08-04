<?php
/**
*@package pXP
*@file gen-UsuarioFilial.php
*@author  (admin)
*@date 24-07-2014 23:54:44
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.UsuarioFilial=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.UsuarioFilial.superclass.constructor.call(this,config);
		this.init();



		 var dataPadre = Phx.CP.getPagina(this.idContenedorPadre).getSelectedData()
         if(dataPadre){
            this.onEnablePanel(this, dataPadre);
         }
         else
         {
            this.bloquearMenus();
         }

		
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_usuario_filial'
			},
			type:'Field',
			form:true 
		},
		{
			//configuraci�n del componente
			config:{
				labelSeparator:'',
				inputType:'hidden',
				name: 'id_usuario'

			},
			type:'Field',
			form:true 
			
		},
		{
			config: {
				name: 'id_filial',
				fieldLabel: 'Filial',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_gerencial/control/Filial/listarFilial',
					id: 'id_filial',
					root: 'datos',
					sortInfo: {
						field: 'nombre',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_filial', 'nombre', 'sigla'],
					remoteSort: true,
					baseParams: {par_filtro: 'fili.nombre#fili.sigla'}
				}),
				valueField: 'id_filial',
				displayField: 'nombre',
				gdisplayField: 'nombre',
				hiddenName: 'id_filial',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['nombre']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'fili.nombre',type: 'string'},
			grid: true,
			form: true
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
				filters:{pfiltro:'usufil.estado_reg',type:'string'},
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
				filters:{pfiltro:'usufil.fecha_reg',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'usuario_ai',
				fieldLabel: 'Funcionaro AI',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:300
			},
				type:'TextField',
				filters:{pfiltro:'usufil.usuario_ai',type:'string'},
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
				type:'Field',
				filters:{pfiltro:'usu1.cuenta',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'id_usuario_ai',
				fieldLabel: 'Creado por',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'usufil.id_usuario_ai',type:'numeric'},
				id_grupo:1,
				grid:false,
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
				type:'Field',
				filters:{pfiltro:'usu2.cuenta',type:'string'},
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
				filters:{pfiltro:'usufil.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Usuario Filial',
	ActSave:'../../sis_gerencial/control/UsuarioFilial/insertarUsuarioFilial',
	ActDel:'../../sis_gerencial/control/UsuarioFilial/eliminarUsuarioFilial',
	ActList:'../../sis_gerencial/control/UsuarioFilial/listarUsuarioFilial',
	id_store:'id_usuario_filial',
	fields: [
		{name:'id_usuario_filial', type: 'numeric'},
		{name:'id_usuario', type: 'numeric'},
		{name:'id_filial', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'nombre', type: 'string'},
	],
	sortInfo:{
		field: 'id_usuario_filial',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,

	/*loadValoresIniciales:function(){
		Phx.vista.UsuarioFilial.superclass.loadValoresIniciales.call(this);
	    this.getComponente('id_usuario').setValue(this.maestro.id_usuario);
	},*/
	
	onReloadPage:function(m){
		this.maestro=m;			
		
		this.store.baseParams={id_usuario:this.maestro.id_usuario};
		//this.load({params:{start:0, limit:this.tam_pag,id_usuario:this.maestro.id_usuario}});
		  this.load({params:{start:0, limit:50}})			
	},
	loadValoresIniciales:function()
    { Phx.vista.UsuarioFilial.superclass.loadValoresIniciales.call(this);
      this.Cmp.id_usuario.setValue(this.maestro.id_usuario);       
       
    },



    
	
	
	}
)
</script>
		
		