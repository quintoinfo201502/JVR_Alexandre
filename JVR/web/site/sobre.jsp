<%@page import="modelo.Vendedor"%>
<%@page import="dao.VendedorDAO"%>
<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp"%>
<%
    VendedorDAO dao = new VendedorDAO();

    List<Vendedor> lista;

    if (request.getParameter("txtFiltro") != null && request.getParameter("txtFiltro") != "") {
        String txtFiltro = request.getParameter("txtFiltro");
        lista = dao.listar(txtFiltro);
    } else {
        lista = dao.listar();
    }
%>
<div class="container">

    <div class="row">
        <div class="box">
            <div class="col-lg-12">
                <hr>
                <h2 class="intro-text text-center">Sobre a
                    <strong>TRANZI's Stok &copy</strong>
                </h2>
                <hr>
            </div>
            <div class="col-md-6">
                <img class="img-responsive img-border-left" src="template/img/tranzis1.jpg" alt="">
            </div>
            <div class="col-md-6">
                <p>Tranzi's Stock &copy faz parte da Tranzi's Company &copy, empresa de referência em vários setores da América.</p>
                <p>A Tranzi's Stock &copy fornece um sistema de estoque de itens de qualquer tipo, sendo adaptado de forma fácil e rápida.</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>


    <div class="row">
        <div class="box">
            <div class="col-lg-12">
                <hr>
                <h2 class="intro-text text-center">Nossa
                    <strong>Equipe</strong>
                </h2>
                <hr>
            </div>
            <%
                for (Vendedor item : lista) {
            %>
            <div class="col-sm-4 text-center">
                <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                <h3><%=item.getNome()%><br>
                    <small><%=item.getEmail()%></small>
                </h3>
            </div>
            <%
                }
            %>
            <div class="clearfix"></div>
        </div>
    </div>

</div>

<%@include file= "rodape.jsp" %>