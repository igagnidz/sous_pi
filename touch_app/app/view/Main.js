Ext.define('SousPi.view.Main', {
    extend: 'Ext.tab.Panel',
    xtype: 'main',
    requires: [
        'Ext.dataview.List',
        'Ext.data.JsonStore'
    ],
    config: {
        tabBarPosition: 'bottom',
        fullscreen: true,

        items: [
            {
                xtype: 'list',
                title: 'Heaters',
                iconCls: 'star',
                itemTpl: '{id} {temperature}',

                store: {
                    type: 'json',

                    fields: [
                        'id', 'temperature', 'set_temperature', 'enabled', 'enabled_at'
                    ],

                    autoLoad: true,

                    proxy: {
//                        type: 'json',
                        url: 'http://lvh.me:9292/all',
                        reader: {
                            type: 'json',
                            rootProperty: 'devices'
                        }
                    }
                }
            }
        ]
    }
});
