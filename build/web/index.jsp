<%-- 
    Document   : index
    Created on : Nov 25, 2020, 12:56:43 AM
    Author     : kedke
--%>
<%@page import="java.util.List"%>
<%@page import="model.CatalogTable"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Catalog"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Shopping</title>
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
            input.submit {}
    </style>
    <jsp:useBean id="catalog" scope="request" class="model.Catalog" />
    <%
        List<Catalog> catalogList = CatalogTable.findAllCatalog();
        Iterator<Catalog> itr = catalogList.iterator();
    %>
    
    <body>
        <center>
            <br/>
            <h1>DVD Catalog</h1>
            <br/>
                <table border="1" padding: 10px; class="table table-bordered">
                    <thead>
                        <tr>
                            <th>DVD NAME</th>
                            <th>RATE</th>
                            <th>YEAR</th>
                            <th>PRICE</th>
                            <th>QUANTITY</th>
                            <th>ADD CART</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                           while (itr.hasNext()) {
                            out.println("<form name=\"AddToCart\" method=\"post\" action=\"AddCartController\" >");
                            catalog = itr.next();
                            out.println("<tr>");
                            out.println("<td hidden><input type=\"number\" name=\"idcatalog\" value=" + catalog.getId() + "></input></td>");
                            out.println("<td> " + catalog.getName() + "</td>");
                            out.println("<td> " + catalog.getRate() + "</td>");
                            out.println("<td> " + catalog.getYears() + "</td>");
                            out.println("<td> " + catalog.getPrice() + "</td>");
                            out.println("<td><input class=\"form-control\" type=\"number\" name=\"quantity\" placeholder=\"Enter Quantity\"></input></td>");
                            out.println("<td><button class=\"btn btn-primary\" type=\"submit\" name=\"addtocart\" id=\"button\"><i class=\"fa fa-shopping-cart\" aria-hidden=\"true\"></i>AddToCart</button></td>");
                            out.println("</tr>");
                            out.println("</form>");
                           }
                        %>
                    </tbody>                
                </table>
        </center>
    </body>
</html>
