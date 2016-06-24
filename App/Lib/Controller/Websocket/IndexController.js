module.exports = Controller(function () {
    //websocket列表
    var wsList = {};
    setInterval(function () {
        console.log(Object.keys(wsList));
        for (var id in wsList) {
            wsList[id].send({
                name: '机器人',
                text: id + '每隔10秒我就发一条消息哦' + new Date().Format("yyyy-MM-dd hh:mm:ss")
            })
        }
    }, 10000)
    return {
        indexAction: function () {
            this.display();
        },
        /**
         * 建立连接
         * @return {[type]} [description]
         */
        openAction: function () {
            var websocket = this.http.websocket;
            var id = websocket.id;
            for (var wid in wsList) {
                wsList[wid].send({
                    name: '系统',
                    text: 'id_' + id + '进入了聊天室'
                });
            }
            wsList[id] = websocket;
            this.http.on("websocket.close", function () {
                console.log('close')
                delete wsList[id];
                for (var wid in wsList) {
                    wsList[wid].send({
                        name: 'id_' + id,
                        text: 'goodbye~~'
                    });
                }
            })
        },
        /**
         * 获取到消息
         * @return {[type]} [description]
         */
        messageAction: function () {
            var data = this.get();
            data.name = 'id_' + this.http.websocket.id;
            data.wslength = Object.keys(wsList).length;
            //有消息后向所有人广播
            for (var id in wsList) {
                wsList[id].send(data);
            }
        }
    }
})

Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S": this.getMilliseconds()
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}