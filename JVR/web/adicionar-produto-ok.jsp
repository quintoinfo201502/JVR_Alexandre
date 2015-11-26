<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    String msg = "";
    if (request.getParameter("txtNome") == null
            || request.getParameter("txtDescricao") == null
            || request.getParameter("txtTamanho") == null
            || request.getParameter("txtId") == null) {
        response.sendRedirect("categoria.jsp");
    } else {

        String nome = request.getParameter("txtNome");
        String descricao = request.getParameter("txtDescricao");
        String tamanho = request.getParameter("txtTamanho");
        String id = request.getParameter("txtId");

        ProdutoDAO dao = new ProdutoDAO();

        Produto obj = new Produto();

        obj.setNomeProduto(nome);
        obj.setDescricao(descricao);
        obj.setTamanho(tamanho);
        obj.setIdprod(Long.parseLong(id));

        try {
            dao.incluir(obj);
            msg = "Registro cadastrado com sucesso";
        } catch (Exception ex) {
            msg = "Erro ao cadastrar registro";
        }
    }

%>        


<div class="container">
    <h1>Cadastro de Produto</h1>
    <%=msg%>.<br />
    <a href="produto.jsp">Voltar para a listagem</a>
</div>
</body>
</html>
