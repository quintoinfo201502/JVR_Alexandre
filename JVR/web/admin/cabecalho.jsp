<%
    if(session.getAttribute("sessao") == null){
       response.sendRedirect("../login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>TRANZIS Stok</title>
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css" />
    </head>
    <body>
        <div class="container">
            <h1>TRANZIS Stok</h1>
        </div>    
        <nav class="navbar navbar-inverse navbar-top" >
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="../index.jsp">Início</a>
                    <a class="navbar-brand" href="../categoria/categoria.jsp">Categoria</a>
                    <a class="navbar-brand" href="../produto/produto.jsp">Produto</a>
                    <a class="navbar-brand" href="../vendedor/vendedor.jsp">Vendedores</a>
                </div>
                <div class="navbar-header before ">
                    <a class="navbar-brand" href="../login.jsp?sair=OK">Sair</a>
                </div>
            </div>
        </nav>


