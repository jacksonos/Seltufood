/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


$(document).ready(function () {
    $.ajax({
        url: "ServletDashboard",
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
        method: "GET",
        success: function (data) {
            var Nombre = [];
            var Stock = [];
            var color = ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)'];
            var bordercolor = ['rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)'];
            console.log(data);

            for (var i in data) {
                Nombre.push(data[i].Nombre);
                Stock.push(data[i].Stock);
            }

            var chartdata = {
                labels: nombre,
                datasets: [{
                        label: Nombre,
                        backgroundColor: color,
                        borderColor: color,
                        borderWidth: 2,
                        hoverBackgroundColor: color,
                        hoverBorderColor: bordercolor,
                        data: Stock
                    }]
            };

            var mostrar = $("#miGrafico");
            /*
             * ****************GRAFICO DE DONA************************
             * 
             var grafico = new Chart(mostrar, {
             type: 'doughnut',
             data: chartdata,
             options: {
             responsive: true,
             scales: {
             yAxes: [{
             ticks: {
             beginAtZero: true
             }
             }]
             }
             }
             });
             */

            //*****************GRAFICO DE BARRAS************************

            var grafico = new Chart(mostrar, {
                type: 'doughnut', // TIPOS: polarArea, doughnut, pie, radar, line, bar
                data: chartdata,
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        title: {
                            display: true,
                            text: 'Chart.js Bar Chart'
                        }
                    }
                },
            });


            /*
             * *****************GRAFICO DE BARRAS HORIZONTAL************************
             * 
             *var grafico = new Chart(mostrar, {
             type: 'bar',
             data: chartdata,
             options: {
             indexAxis: 'y',
             // Elements options apply to all of the options unless overridden in a dataset
             // In this case, we are setting the border of each horizontal bar to be 2px wide
             elements: {
             bar: {
             borderWidth: 2,
             }
             },
             responsive: true,
             plugins: {
             legend: {
             position: 'right',
             },
             title: {
             display: true,
             text: 'Chart.js Horizontal Bar Chart'
             }
             }
             },
             });
             */


        },
        error: function (data) {
            console.log(data);
        }
    });
});