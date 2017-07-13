<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    String msg = "";
    if (request.getParameter("txtNome") == null
            || request.getParameter("txtDescricao") == null
            || request.getParameter("txtId") == null) {
        response.sendRedirect("categoria.jsp");
    } else {

        String nome = request.getParameter("txtNome");
        String descricao = request.getParameter("txtDescricao");
        String idcat = request.getParameter("txtId");

        CategoriaDAO dao = new CategoriaDAO();

        Categoria obj = new Categoria();

        obj.setNomeCat(nome);
        obj.setDescricao(descricao);
        obj.setIdcat(Long.parseLong(idcat));

        try {
            dao.incluir(obj);
            msg = "Registro cadastrado com sucesso";
        } catch (Exception ex) {
            msg = "Erro ao cadastrar registro";
        }
    }
%>


<div class="container">
    <h1 class="center-block">Cadastro de Categoria</h1>
    <%=msg%>. <br />
    <a href="lista-categoria.jsp">Voltar para a Listagem</a>

</div>

</body>
</html>
