Ext.onReady(function() {

	var encode = false;
	var local = true;

	var bookInfo = new Ext.data.Store({
		autoLoad : false,
		proxy : new Ext.data.HttpProxy({}),
		reader : new Ext.data.JsonReader({
			root : 'items'
		}, [ {
			name : 'name'
		}, {
			name : 'ISBN'
		}, {
			name : 'yearOfRelease'
		}, {
			name : 'id'
		} ])
	});

	var userInfo = new Ext.data.JsonStore({
		autoLoad : true,
		autoDestroy : true,
		url : window.location.origin + '/library/user/userJson',
		idProperty : 'id',
		root : 'items',
		fields : [ {
			name : 'email'
		}, {
			name : 'name'
		}, {
			name : 'surname'
		}, {
			name : 'id'
		}, {
			name : 'dateOfBirth'
		}, {
			name : 'personalNo'
		} ]
	});

	var win = new Ext.Window({
		layout : 'fit',
		width : 520,
		height : 300,
		closeAction : 'hide',
		plain : true,

		items : [ {
			xtype : 'grid',
			store : bookInfo,
			columns : [ {
				header : "Id",
				width : 50,
				dataIndex : 'id'
			}, {
				header : "Book",
				width : 150,
				dataIndex : 'name'
			}, {
				header : "ISBN",
				width : 150,
				dataIndex : 'ISBN'
			}, {
				header : "Realise year",
				width : 150,
				dataIndex : 'yearOfRelease'
			} ]
		} ],
	});

	var cm = new Ext.grid.ColumnModel([ {
		header : "Id",
		width : 50,
		dataIndex : 'id',
	}, {
		header : "Email",
		width : 202,
		dataIndex : 'email',
	}, {
		header : "Name",
		width : 100,
		dataIndex : 'name',
	}, {
		header : "Surname",
		width : 100,
		dataIndex : 'surname',
	}, {
		header : "Birth date",
		width : 100,
		dataIndex : 'dateOfBirth',
	}, {
		header : "Personal No.",
		width : 100,
		dataIndex : 'personalNo',
	} ]);

	var filters = new Ext.ux.grid.GridFilters({
		encode : encode,
		local : local,
		filters : [ {
			type : 'numeric',
			dataIndex : 'id'
		}, {
			type : 'string',
			dataIndex : 'email'
		}, {
			type : 'string',
			dataIndex : 'name'
		}, {
			type : 'date',
			dataIndex : 'dateOfBirth'
		}, {
			type : 'string',
			dataIndex : 'surname'
		}, {
			type : 'string',
			dataIndex : 'personalNo'
		} ]
	});

	function showMenu(grid, index, event) {
		event.stopEvent();
		var record = grid.getStore().getAt(index);
		var menu = new Ext.menu.Menu({
			items : [ {
				text : 'Show',
				handler : function() {
					location.href = 'show/' + record.data.id;
				}
			}, {
				text : 'Edit',
				handler : function() {
					location.href = 'edit/' + record.data.id;
				}
			} ]
		}).showAt(event.xy);
	}

	var grid = new Ext.grid.GridPanel({
		border: false,
		frame : true,
		title : 'Users',
		height : 215,
		width : 670,
		loadMask: true,
		store : userInfo,
		cm : cm,
		plugins : [ filters ],
		sm : new Ext.grid.RowSelectionModel({
			singleSelect : true,
			listeners : {
				rowselect : {
					fn : function(sm, index, record) {
						bookInfo.proxy.setApi(Ext.data.Api.actions.read,
								 window.location.origin + '/library/user/bookJson/'
										+ record.data.id);
						bookInfo.load();
						win.show(this);
					}
				}
			}
		}),
		listeners: {
		    rowcontextmenu: function(grid, index, event) {
		         showMenu(grid, index, event);
		    }
		}
	});
	grid.render('grid');
});