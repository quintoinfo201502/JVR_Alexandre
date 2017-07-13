<%@page import="java.util.List"%>
<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@include file="../cabecalho.jsp" %>
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
    <h1 class="center-block">Lista de Produtos</h1>

    <div>
        <a href="produto.jsp">Voltar</a> <br />
        
            <form action="lista-produto.jsp" method="post">
                <input type="text" name="txtFiltro" />
                <input type="submit" class="btn btn-default" value="Pesquisar" /> <br />
            </form>
        
        <br />
            <table class="table table-bordered">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Tamanho</th>
                    <th>Descrição</th>
                    <th>Categoria</th>

                    <th>Ações</th>
                </tr>
                <%
                    for (Produto item : lista) {
                %>
                <tr>
                    <td><%=item.getIdprod()%></td>
                    <td><%=item.getNomeProduto()%></td>
                    <td><%=item.getTamanho()%></td>
                    <td><%=item.getDescricao()%></td>
                    <td><%=item.getIdcat()%></td>
                    <td>
                        <a href="atualizar-produto.jsp?idprod=<%=item.getIdprod()%>">Editar</a>
                        <a href="excluir-produto.jsp?idprod=<%=item.getIdprod()%>">Excluir</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>

    </div>
</div>

</body>
</html>