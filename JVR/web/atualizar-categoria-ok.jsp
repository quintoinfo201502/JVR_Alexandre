<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    String idCat = request.getParameter("txtId");
    String nome = request.getParameter("txtNome");
    String descricao = request.getParameter("txtDescricao");

    CategoriaDAO dao = new CategoriaDAO();
    Categoria obj = dao.buscarPorChavePrimaria(Long.parseLong(idCat));

    obj.setNomeCat(nome);
    obj.setDescricao(descricao);

    dao.alterar(obj);
%>

<div class="container">
    <h1 class="center-block">Atualização de Categoria</h1>
    <div class="container">
        O Registro <%=idCat%> foi alterado com sucesso. <br />
        <a href="lista-categoria.jsp">Voltar para a Listagem</a>

    </div>
</body>
</html>
