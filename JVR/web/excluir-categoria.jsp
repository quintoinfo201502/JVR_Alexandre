    <%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="cabecalho.jsp"%>
<%
        String idCat = request.getParameter("idCat");
        CategoriaDAO dao = new CategoriaDAO();
        Categoria categoria = dao.buscarPorChavePrimaria(Long.parseLong(idCat));      
        dao.excluir(categoria);
%>
    
    <div class="container">
        <h1 class="center-block">Exclusão de Categoria</h1>
        O Registro <%=idCat%> foi excluído com sucesso.<br />
        <a href="lista-categoria.jsp">Voltar para a Listagem</a>
        
    </div>

    </body>
</html>
