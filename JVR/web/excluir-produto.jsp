<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    String idprod = request.getParameter("idprod");
    ProdutoDAO dao = new ProdutoDAO();
    Produto produto = dao.buscarPorChavePrimaria(Long.parseLong(idprod));
    dao.excluir(produto);
%>

<div class="container">
    <h1 class="center-block">Exclusão de Produto</h1>
    O Registro <%=idprod%> foi excluído com sucesso.<br />
    <a href="lista-produto.jsp">Voltar para a Listagem</a>

</div>

</body>
</html>
