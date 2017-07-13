<%@page import="java.util.List"%>
<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    ProdutoDAO dao = new ProdutoDAO();

    List<Produto> lista;

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
                <h2 class="intro-text text-center">Nossos
                    <strong>Produtos</strong>
                </h2>
                <hr>
            </div>
            <%
                for (Produto item : lista) {
            %>
            <div class="col-sm-4 text-center">
                <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                <h3><%=item.getNomeProduto()%><br>
                    <small><%=item.getTamanho()%></small>
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