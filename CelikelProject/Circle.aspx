<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Circle.aspx.cs" Inherits="CelikelProject.Circle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head >
        <title>Scroll Event Demo</title>
        <style>
            #circle {
                width: 100px;
                height: 100px;
                background-color: #2EC4B6;
                border-radius: 50%;
                position: fixed;
                left: 50%;
                transform: translateX(-50%);
                transition: opacity 0.5s;
            }
        </style>
    </head>
    <body onscroll="handleScroll()">
        <div style="height:1000px;">
        <div id="circle"></div>
            </div>
        <script>
            function handleScroll() {
                var circle = document.getElementById("circle");
                var scrollPosition = window.pageYOffset || document.documentElement.scrollTop;

                if (scrollPosition > 100) {
                    circle.style.opacity = "0";
                } else {
                    circle.style.opacity = "1";
                }
            }
        </script>
    </body>
    </html>
</asp:Content>
