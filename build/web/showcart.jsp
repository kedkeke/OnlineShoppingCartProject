<%-- 
    Document   : showcart
    Created on : Nov 25, 2020, 2:02:07 AM
    Author     : kedke
--%>
<%@page import="java.util.List"%>
<%@page import="model.CartTable"%>
<%@page import="model.Cart"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="java.util.Vector"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Shopping Cart</title>
    </head>
    <style>
            th, td {
                padding: 10px;
                text-align: center;
            }
            A {
                color: white;
                text-decoration: none;
            }
            btn {
                margin-left:67px;
                width: 210px
            }
    </style>
    <jsp:useBean id="cart" scope="request" class="model.Cart" />
    <%
        List<Cart> cartList = CartTable.findAllCart();
        Iterator<Cart> itr = cartList.iterator();
    %>
    <body>
        <center>
            <br/>
            <h1>Shopping Cart</h1>
            <br/>
                <table border="1" padding: 10px; class="table table-bordered">
                    <thead>
                        <tr>
                            <th>DVD NAMES</th>
                            <th>RATE</th>
                            <th>YEAR</th>
                            <th>PRICE</th>
                            <th>QUANTITY</th>
                            <th>REMOVE</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                           while (itr.hasNext()) {
                            out.println("<form name=\"AddToCart\" method=\"post\" action=\"RemoveController\" >");
                            cart = itr.next();
                            out.println("<tr>");
                            out.println("<td hidden><input type=\"number\" name=\"id\" value=" + cart.getId() + "></input></td>");
                            out.println("<td> " + cart.getIdcatalog().getName() + "</td>");
                            out.println("<td> " + cart.getIdcatalog().getRate()  + "</td>");
                            out.println("<td> " + cart.getIdcatalog().getYears() + "</td>");
                            out.println("<td> " + cart.getIdcatalog().getPrice() + "</td>");
                            out.println("<td> " + cart.getQuantity() + "</td>");
                            out.println("<td><button class=\"btn btn-danger\" type=\"submit\" name=\"remove\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i>Remove</button></td>");
                            out.println("</tr>");
                            out.println("</form>");
                           }
                        %>
                    </tbody>                
                </table>
                <br>  
                <div class="row" style="align-items: center; margin-right: 15px" >
                    <div class="col">
                        <button type="button" class="btn btn-secondary" onclick="window.location.href = '/OnlineShopping/index'" ><i class="fa fa-arrow-left" aria-hidden="true"></i>Back to Catalog</button>
                    </div>
                    <div class="col">
                        <button  type="button" class="btn btn-success" onclick="window.location.href = '/OnlineShopping/ConfirmController'"><i class="fa fa-arrow-left" aria-hidden="true"></i>Confirm Order</button>
                    </div>
                </div>
        </center>
       
    </body>
</html>
