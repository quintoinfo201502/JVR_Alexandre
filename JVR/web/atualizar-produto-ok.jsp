<%@page import="modelo.Categoria"%>
<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@include file="cabecalho.jsp"%>
<%
        String nome = request.getParameter("txtNome");
        String descricao = request.getParameter("txtDescricao");
        String tamanho = request.getParameter("txtTamanho");
        String idprod = request.getParameter("txtId");
        String idcat = request.getParameter("selCategoria"); //chave estrangeira

        ProdutoDAO dao = new ProdutoDAO();

        Produto obj = dao.buscarPorChavePrimaria(Long.parseLong(idprod));
        
        Categoria objCat = new Categoria();
        objCat.setIdcat(Long.parseLong(idcat));
        
        obj.setIdprod(Long.parseLong(idprod));
        obj.setNomeProduto(nome);
        obj.setDescricao(descricao);
        obj.setTamanho(tamanho);
        obj.setCategoria(objCat);
        
        dao.alterar(obj);
%>    

<div class="container">
    <h1 class="center-block">Atualização de Produto</h1>
    <div class="container">
        O Registro foi alterado com sucesso. <br />
        <a href="lista-produto.jsp">Voltar para a Listagem</a>

    </div>
</body>
</html>
