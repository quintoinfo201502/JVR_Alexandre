<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    String msg = "";
    if (request.getParameter("txtNome") == null
            || request.getParameter("txtDescricao") == null
            || request.getParameter("txtTamanho") == null
            || request.getParameter("txtId") == null
            || request.getParameter("selCategoria") == null) {
        response.sendRedirect("produto.jsp");
    } else {

        String nome = request.getParameter("txtNome");
        String descricao = request.getParameter("txtDescricao");
        String tamanho = request.getParameter("txtTamanho");
        String id = request.getParameter("txtId");
        String idcat = request.getParameter("selCategoria"); //chave estrangeira

        ProdutoDAO dao = new ProdutoDAO();

        Produto obj = new Produto();

        Categoria categoria = new Categoria();
        categoria.setIdcat(Long.parseLong(idcat));
        
        CategoriaDAO daoc = new CategoriaDAO();
        
        Categoria objC = daoc.buscarPorChavePrimaria(Long.parseLong(idcat));
        
        
        
        
        obj.setNomeProduto(nome);
        obj.setDescricao(descricao);
        obj.setTamanho(tamanho);
        obj.setIdprod(Long.parseLong(id));
        obj.setIdcat(objC);
        

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
    Registro cadastrado com sucesso.<br />
    <a href="lista-produto.jsp">Voltar para a listagem</a>
</div>
</body>
</html>
