<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DataGraphic.aspx.cs" Inherits="CelikelProject.DataGraphic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <title>Çelikel Stok Grafiği</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            #chartContainer {
                width: 600px;
                height: 300px;
                margin-bottom:50px;
            }
            #mainContainer{
                height: 400px;
            }
        </style>
    </head>
    
    <body>
        <div id="mainContainer">
            <div id="chartContainer">
                <h1 style="">Çelikel Stok Takibi</h1>
                <hr />
                
                <canvas id="chartCanvas"></canvas>
            </div>
        </div>
    </body>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Sayfa yüklendiğinde çalışacak JavaScript kodları
                var chartData = <%= GetChartData() %>; /*grafik verilerini burdan getirdik.*/

            var ctx = document.getElementById('chartCanvas').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: chartData.labels,
                    datasets: [{
                        label: 'Stok',
                        data: chartData.values,
                        backgroundColor: '#2EC4B6',
                        borderColor: '#001627',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        });

            function GetDataForChart() {
                // ViewState'den verileri al
                var chartData = <%= GetChartData() %>;
                return JSON.stringify(chartData);
            }
        </script>
    
    </html>
</asp:Content>
