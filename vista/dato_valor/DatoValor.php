<?php
/**
*@package pXP
*@file gen-DatoValor.php
*@author  (admin)
*@date 24-07-2014 07:59:41
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.DatoValor=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		this.initButtons=[this.cmbGestion, this.cmbFilial];
		Phx.vista.DatoValor.superclass.constructor.call(this,config);
		this.init();
		//this.load({params:{start:0, limit:this.tam_pag}})





	    console.log(Phx.CP.config_ini.id_filial);

		this.cmbGestion.on('select',function () {
			
			this.load({params:{start:0, limit:this.tam_pag,id_gestion_periodo:this.cmbGestion.getValue(), id_filial:this.cmbFilial.getValue() }});
			//this.Cmp.id_dato_valor.store.baseParams = Ext.apply({id_gestion:this.cmbGestion.getValue()}, this.Cmp.id_dato_valor.store.baseParams);
		
		},this);
		
		this.cmbGestion.store.load({params:{start:0, limit:this.tam_pag}, scope:this,callback: function (arr,op,suc) {
			this.cmbGestion.setValue(arr[0].data.id_gestion_periodo);
			//this.Cmp.id_dato_valor.store.baseParams = Ext.apply({id_gestion:this.cmbGestion.getValue()}, this.Cmp.id_dato_valor.store.baseParams);			
		}});




		this.cmbFilial.on('select',function () {
			
			this.load({params:{start:0, limit:this.tam_pag,id_filial:this.cmbFilial.getValue(),id_gestion_periodo:this.cmbGestion.getValue() }});
			//this.Cmp.id_dato_valor.store.baseParams = Ext.apply({id_gestion:this.cmbGestion.getValue()}, this.Cmp.id_dato_valor.store.baseParams);
		
		},this);
		
		this.cmbFilial.store.load({params:{start:0, limit:this.tam_pag}, scope:this,callback: function (arr,op,suc) {
			this.cmbFilial.setValue(arr[0].data.id_filial);
			//this.Cmp.id_dato_valor.store.baseParams = Ext.apply({id_gestion:this.cmbGestion.getValue()}, this.Cmp.id_dato_valor.store.baseParams);			
		}});


		
		
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_dato_valor'
			},
			type:'Field',
			form:true 
		},
		{
			config: {
				name: 'id_tipo_dato',
				fieldLabel: 'Dato',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_gerencial/control/TipoDato/listarTipoDato',
					id: 'id_tipo_dato',
					root: 'datos',
					sortInfo: {
						field: 'nombre',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_tipo_dato', 'nombre', 'codigo'],
					remoteSort: true,
					baseParams: {par_filtro: 'tipdat.nombre#tipdat.codigo'}
				}),
				valueField: 'id_dato',
				displayField: 'nombre',
				gdisplayField: 'nombre_tipdat',
				hiddenName: 'id_tipo_dato',
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
					return String.format('{0}', record.data['nombre_tipdat']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'tipdat.nombre',type: 'string'},
			grid: true,
			form: true
		},
		{
			config:{
				labelSeparator:'',
				inputType:'hidden',
				name: 'id_filial'
		},
			type:'Field',
			form:true 
		},
		{
			config:{
				name: 'valor',
				fieldLabel: 'Valor',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				
				maxLength:1179650
			},
				type:'NumberField',
				filters:{pfiltro:'valor.valor',type:'numeric'},
				id_grupo:1,
				grid:true,
				egrid:true,
				form:true
		},
	/*	{
			config: {
				name: 'id_gestion_periodo',
				fieldLabel: 'Periodo',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_/control/Clase/Metodo',
					id: 'id_',
					root: 'datos',
					sortInfo: {
						field: 'nombre',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_', 'nombre', 'codigo'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_',
				displayField: 'nombre',
				gdisplayField: 'desc_',
				hiddenName: 'id_gestion_periodo',
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
					return String.format('{0}', record.data['desc_']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'movtip.nombre',type: 'string'},
			grid: true,
			form: true
		},*/
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
				filters:{pfiltro:'valor.estado_reg',type:'string'},
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
				name: 'fecha_reg',
				fieldLabel: 'Fecha creación',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y H:i:s'):''}
			},
				type:'DateField',
				filters:{pfiltro:'valor.fecha_reg',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'id_usuario_ai',
				fieldLabel: 'Fecha creación',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'valor.id_usuario_ai',type:'numeric'},
				id_grupo:1,
				grid:false,
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
				filters:{pfiltro:'valor.usuario_ai',type:'string'},
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
				filters:{pfiltro:'valor.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Valor',
	ActSave:'../../sis_gerencial/control/DatoValor/insertarDatoValor',
	ActDel:'../../sis_gerencial/control/DatoValor/eliminarDatoValor',
	ActList:'../../sis_gerencial/control/DatoValor/listarDatoValor',
	id_store:'id_dato_valor',
	fields: [
		{name:'id_dato_valor', type: 'numeric'},
		{name:'id_dato', type: 'numeric'},
		{name:'id_filial', type: 'numeric'},
		{name:'valor', type: 'numeric'},
		{name:'id_gestion_periodo', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'codigo_tipdat', type: 'string'},
		{name:'nombre_tipdat', type: 'string'}
	],
	sortInfo:{
		field: 'id_dato_valor',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true,
	 cmbGestion:new Ext.form.ComboBox({
			fieldLabel: 'Periodo/Gestion',
			allowBlank: true,
			emptyText:'Periodo/Gestion',
			store:new Ext.data.JsonStore(
			{
				url: '../../sis_gerencial/control/GestionPeriodo/listarGestionPeriodo',
				id: 'id_gestion_periodo',
				root: 'datos',
				sortInfo:{
					field: 'gestion,periodo',
					direction: 'ASC'
				},
				totalProperty: 'total',
				fields: ['id_gestion_periodo','gestion','periodo','periodo_gestion'],
				// turn on remote sorting
				remoteSort: true,
				baseParams:{estado_reg:'abierto'}
			}),
			valueField: 'id_gestion_periodo',
			triggerAction: 'all',
			displayField: 'periodo_gestion',
		    hiddenName: 'id_gestion_periodo',
			mode:'remote',
			pageSize:50,
			queryDelay:500,
			listWidth:'280',
			width:80
		}),



		 cmbFilial:new Ext.form.ComboBox({
				fieldLabel: 'Filial',
				allowBlank: true,
				emptyText:'Filial',
				store:new Ext.data.JsonStore(
				{
					url: '../../sis_gerencial/control/Filial/listarFilial',
					id: 'id_filial',
					root: 'datos',
					sortInfo:{
						field: 'nombre',
						direction: 'DESC'
					},
					totalProperty: 'total',
					fields: ['id_filial','nombre','codigo'],
					// turn on remote sorting
					remoteSort: true,
					baseParams:{par_filtro:'nombre', id_filial:Phx.CP.config_ini.id_filial}
				}),
				valueField: 'id_filial',
				triggerAction: 'all',
				displayField: 'nombre',
			    hiddenName: 'id_filial',
				mode:'remote',
				pageSize:50,
				queryDelay:500,
				listWidth:'280',
				width:180
			}),
		
	
	}
)
</script>
		
		