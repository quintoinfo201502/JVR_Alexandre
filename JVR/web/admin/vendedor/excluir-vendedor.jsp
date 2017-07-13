<%@page import="modelo.Vendedor"%>
<%@page import="dao.VendedorDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    String idVendedor = request.getParameter("idVendedor");

    VendedorDAO dao = new VendedorDAO();

    Vendedor obj = dao.buscarPorChavePrimaria(Long.parseLong(idVendedor));

    dao.excluir(obj);

%>

<div class="container">
    <h1 class="center-block">Exclusão de Categoria</h1>
    O Registro <%=idVendedor%> foi excluído com sucesso.<br />
    <a href="lista-vendedor.jsp">Voltar para a listagem</a>

</div>

</body>
</html>
