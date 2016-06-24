module.exports = Controller("Home/BaseController", function () {
    "use strict";
    return {
        addAction: function () {
            var self = this;
            var myPost = this.post();
            myPost.mode = 'web';

            D('config').thenAdd(myPost, {configName: myPost.configName}, true).then(function (rt) {
                if (rt.type == 'exist') {
                    D('config').where({configName: myPost.configName}).update(myPost).then(function(affectedRows){
                    });
                }
                var result = {
                    status: true,
                    info: "保存成功",
                    error: null
                };
                return self.json(result);
            });
        },
        deleteAction: function () {
            var self = this;
            var configName = this.get('name');
            D('config').where({configName: configName}).delete().then(function (affectedRows) {
                var result = {
                    status: true,
                    info: "删除成功",
                    error: null
                };
                return self.json(result);
            });
        },
        editAction: function () {
            var self = this;
            var configName = this.get('name');
            D('config').where({configName: configName}).find().then(function (data) {
                if (!isEmpty(data.levels)) {
                    data.levels = JSON.parse(data.levels);
                }
                console.log(data.selector);
                var result = {
                    status: true,
                    data: data
                };
                return self.json(result);
            });
        }
    };
});