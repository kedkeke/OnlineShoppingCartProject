<%-- 
    Document   : confirm
    Created on : Nov 25, 2020, 2:28:14 AM
    Author     : kedke
--%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Confirm Order</title>
    </head>
    <style>
        h1{
            text-align: center;
        }
    </style>
    <body>
        <br/>
        <div class="col">
            <button style="margin-left:67px; width: 210px" type="button" class="btn btn-secondary" onclick="window.location.href = '/OnlineShopping/index'" ><i class="fa fa-arrow-left" aria-hidden="true"></i>Back to Catalog</button>
        </div>
        <br/>
        <%
            double total = (Double) request.getAttribute("total");
            
        %>
       
        <h1>Your Order is confiemed! </h1>
        <h1>The total amount is $<%= total %></h1> 
            
       
    </body>
</html>
