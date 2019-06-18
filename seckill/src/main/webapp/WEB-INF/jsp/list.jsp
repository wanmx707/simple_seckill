<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="comman/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>秒杀列表页</title>
    <%@include file="comman/head.jsp" %>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h1>秒杀列表</h1>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>名称</th>
                    <th>库存</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>创建时间</th>
                    <th>详情</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="sk">
                    <tr>
                        <td>${sk.name}</td>
                        <td>${sk.number}</td>
                        <td>
                            <fmt:formatDate value="${sk.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td>
                            <fmt:formatDate value="${sk.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td>
                            <fmt:formatDate value="${sk.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td><a class="btn btn-info" href="/seckill/${sk.seckillId}/detail"
                               target="_blank">link</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div style="width: 50%">
                <canvas id="myChart" width="200"></canvas>
                <canvas id="myChart2" width="200"></canvas>
                <canvas id="myChart3" width="200"></canvas>
            </div>
            <div style="width: 50%">
            </div>
        </div>
    </div>
</div>
</body>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src='https://cdn.bootcss.com/Chart.js/2.7.3/Chart.js'></script>

<script>
    var arr_number=new Array();
    var arr_name=new Array();
    <c:forEach items="${list}" var="sk">
    arr_number.push("${sk.number}");
    arr_name.push("${sk.name}");
    </c:forEach>
//折线图
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: arr_name,
            datasets: [{
                label: '秒 杀 余 量',
                data: arr_number,
                backgroundColor: 'rgba(0, 0, 0, 0.2)',
                borderColor: 'rgba(255, 45, 23, 1)',
                borderWidth: 1,
                pointBorderColor: "rgba(102,205,0,0.5)",
                pointBackgroundColor: "#0000CD",
                pointBorderWidth: 5,
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(0,0,0,1)",
                pointHoverBorderColor: "rgba(0 0 238)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius: 10,
            },{
                label: '秒 杀  量',
                data: [12,34,56,78],
                backgroundColor: 'rgba(0, 0, 0, 0.4)',
                borderColor: 'rgba(0, 0, 0, 1)',
                borderWidth: 1,
            }]
        },

        options: {
            responsive: true,//图表是否响应式
            //图表标题相关配置
            title:{
                display:true,
                text:'秒杀数据',
                fontSize:20,
            },
            hover:{
                intersect:true,
            },
            tooltips: {
                titleFontFamily: 'Helvetica Neue',
                titleFontSize: 14,
                yPadding: 14,
                xPadding: 8,
                bodyFontSize: 14,
                titleMarginBottom: 10,
                position: 'nearest',//tooltips就近显示
            },
            legend:{
                labels:{
                    fontColor:'black'
                }
            },
            scales: {

                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }],
                xAxes:[{
                    ticks:{
                        autoSkip:false,
                        offset:false,
                        maxRotation:0,
                        minRotation:0,
                        distrubution:'linear'
                    }
                }]
            }
        }
    });
//竖状图
    var ctx1 = document.getElementById('myChart2').getContext('2d');
    var myChart2 = new Chart(ctx1, {
        type: 'bar',
        data: {
            labels: arr_name,
            datasets: [{
                label: '秒 杀 余 量',
                data: arr_number,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)'
                ],
                borderWidth: 1,
                pointBorderColor: "rgba(102 205 0)",
                pointBackgroundColor: "#fff",
                pointBorderWidth: 5,
                pointHoverRadius: 5,
                pointHoverBackgroundColor: [
                    "rgba(75,192,192)",
                    "rgba(75,92,192)",
                    "rgba(75,192,92)",
                    "rgba(175,192,2)",
                ],
                pointHoverBorderColor: "rgba(0 0 238)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius: 10,
            },{
                label: '秒 杀  量',
                data: [34,24,56,48],
                backgroundColor: 'rgba(255, 255, 255, 0.4)',
                borderColor: 'rgba(0, 0, 0, 1)',
                borderWidth: 1,
                type:'line'
            }]
        },

        options: {
            responsive: true,//图表是否响应式
            //图表标题相关配置
            title:{
                display:true,
                text:'秒杀数据',
                fontSize:20,
            },
            hover:{
                intersect:true,
            },
            tooltips: {
                titleFontFamily: 'Helvetica Neue',
                titleFontSize: 14,
                yPadding: 14,
                xPadding: 8,
                bodyFontSize: 14,
                titleMarginBottom: 10,
                position: 'nearest',//tooltips就近显示
            },
            legend:{
                labels:{
                    fontColor:'black'
                }
            },
            scales: {

                yAxes: [{
                    stacked: true,
                    ticks: {
                        beginAtZero: true

                    }
                }],
                xAxes:[{
                    ticks:{
                        autoSkip:false,
                        offset:false,
                        maxRotation:0,
                        minRotation:0,
                        distrubution:'linear'
                    }
                }]
            }
        }
    });
//雷达图
    var ctx2 = document.getElementById('myChart3').getContext('2d');
    var myChart3 = new Chart(ctx2, {
        type: 'radar',
        data: {
            labels: arr_name,
            datasets: [{
                label: '秒 杀 余 量',
                data: arr_number,
                backgroundColor: 'rgba(24, 99, 132, 0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 1,
                pointBorderColor: "rgba(102 205 0)",
                pointBackgroundColor: "#fff",
                pointBorderWidth: 5,
                pointHoverRadius: 5,
                pointHoverBackgroundColor: [
                    "rgba(75,192,192)",
                    "rgba(75,92,192)",
                    "rgba(75,192,92)",
                    "rgba(175,192,2)",
                ],
                pointHoverBorderColor: "rgba(0,0,238)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius: 10,
            },{
                label: '秒 杀  量',
                data: [12,34,56,78],
                backgroundColor: 'rgba(0, 0, 0, 0.4)',
                borderColor: 'rgba(0, 0, 0, 1)',
                borderWidth: 1,
            }]
        },

        options: {
            responsive: true,//图表是否响应式
            //图表标题相关配置
            title:{
                display:true,
                text:'秒杀数据',
                fontSize:20,
            },
            hover:{
                intersect:true,
            },
            tooltips: {
                titleFontFamily: 'Helvetica Neue',
                titleFontSize: 14,
                yPadding: 14,
                xPadding: 8,
                bodyFontSize: 14,
                titleMarginBottom: 10,
                position: 'nearest',//tooltips就近显示
            },
            legend:{
                labels:{
                    fontColor:'black'
                }
            },
            scale:{
                ticks:{
                    suggestionMin:0,
                    suggestionMax:100,
                    stepSzie:20
                }
            }
        }
    });
</script>
</html>
