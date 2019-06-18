//存放交互逻辑
var seckill = {
    //封装秒杀相关的url
    URL: {
        now: function () {
            return '/seckill/time/now';
        },
        exposer: function (seckillId) {
            return '/seckill/' + seckillId + '/exposer';
        },
        execution:function (seckillId,md5) {
            return '/seckill/'+seckillId+'/'+md5+'/execution';
        }
    },
    handleSeckillkill: function (seckillId, node) {
        node.hide().html('<button class="btn btn-primary btn-lg" id="killBtn">开始秒杀</button>');
        $.post(seckill.URL.exposer(seckillId), {}, function (result) {
            //回调函数中执行交互流程
            if (result && result['success']) {
                var exposer = result['data'];
                if (exposer['exposed']) {
                    //开启秒杀
                    //获取秒杀地址
                    var md5=exposer['md5'];
                    var killUrl=seckill.URL.execution(seckillId,md5);
                    //one绑定一次点击时间
                    $('#killBtn').one('click',function () {
                        //绑定执行秒杀请求
                        //禁用按钮
                        $(this).addClass('disabled');
                        //发送执行秒杀的请求
                        $.post(killUrl,{},function (result) {
                            console.log("result"+result['data']);
                            if(result&&result['success']){
                                var killResult=result['data'];
                                var state=killResult['state'];
                                var stateInfo=killResult['stateinfo'];
                                //显示结果
                                node.html('<span class="label label-success">'+stateInfo+'</span>');
                            }
                        });
                    });
                    node.show();
                } else {
                    //未开启秒杀
                    var now = exposer['now'];
                    var start = exposer['start'];
                    var end = exposer['end'];
                    //重新计算计时逻辑
                    seckill.countDown(seckillId, now.start, end);
                }
            } else {
                console.log("exposer=" + exposer);
            }
        });

        //处理秒杀逻辑
    },
    //验证手机号
    valicatedphone: function (phone) {
        if (phone && phone.length == 11 && !isNaN(phone)) {
            return true;
        } else {
            return false;
        }
    },
    countDown: function (seckillId, nowTime, startTime, endTime) {
        var seckillBox = $('#seckill-box');
        if (nowTime > endTime) {
            //秒杀结束
            seckillBox.html('秒杀结束');
        } else if (nowTime < startTime) {
            //秒杀未开始，倒计时
            var killTime = new Date(startTime);

            seckillBox.countdown(killTime, function (event) {
                var format = event.strftime('秒杀倒计时：%D天 %H时 %M分 %S秒');
                seckillBox.html(format)
                //时间完成后回调函数
            }).on('finish.countdown', function () {
                //获取秒杀地址，控制实现逻辑
                seckill.handleSeckillkill(seckillId, seckillBox);
            });
        } else {
            //秒杀开始
            seckill.handleSeckillkill(seckillId, seckillBox);
        }
    },
    //详细页秒杀逻辑
    detail: {
        init: function (params) {
            //用户手机验证，计时交互
            var killPhone = $.cookie('killPhone');
            console.log("cookie="+killPhone);
            if (!seckill.valicatedphone(killPhone)) {
                //绑定phone
                //控制输出
                var killPhoneModal = $("#killPhoneModal");
                killPhoneModal.modal({
                    show: true,
                    backdrop: 'static',//禁止关闭位置
                    keyboard: false//关闭键盘
                });
                $('#killPhoneBtn').click(function () {
                    var inputPhone = $('#killPhoneKey').val();
                    console.log('inputPhone=' + inputPhone);
                    if (seckill.valicatedphone(inputPhone)) {
                        $.cookie('killPhone', inputPhone, {expires: 7, path: '/seckill_war_exploded/seckill'});
                        window.location.reload();
                    } else {
                        $('#killPhoneMessage').hide().html('<label class="label label-danger">手机号错误！！！</label>').show(300);
                    }
                });
            }
            //已经登录
            //计时交互
            var startTime = params['startTime'];
            var endTime = params['endTime'];
            var seckillId = params['seckillId'];
            $.get(seckill.URL.now(), {}, function (result) {
                if (result && result['success']) {
                    var nowTime = result['data'];
                    console.log("seckillId=" + seckillId + "nowTime=" + nowTime + "startTime=" + startTime + "endTime=" + endTime);
                    //时间判断startTime
                    seckill.countDown(seckillId, nowTime, startTime, endTime);
                } else {
                    console.log('result=' + result);
                }
            });
        }
    }
}