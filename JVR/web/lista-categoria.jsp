<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    CategoriaDAO dao = new CategoriaDAO();

    List<Categoria> lista;
    
    if(request.getParameter("txtFiltro")!=null && request.getParameter("txtFiltro")!=""){
        String txtFiltro = request.getParameter("txtFiltro");
        lista = dao.listar(txtFiltro);
    }
    else {
        lista = dao.listar();
    }
%>

<div class="container">
    <h1 class="center-block">Lista de Categorias</h1>

    <div>
        <a href="categoria.jsp">Voltar</a> <br />
        <form action="lista-categoria.jsp" method="post">
            <input type="text" name="txtFiltro" />
            <input type="submit" class="btn btn-default" value="Pesquisar" /> <br />
        </form>
        <br/>
            <table class="table table-bordered">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>

                    <th>Ações</th>
                </tr>
                <%
                    for (Categoria item : lista) {
                %>
                <tr>
                    <td><%=item.getIdcat()%></td>
                    <td><%=item.getNomeCat()%></td>
                    <td>
                        <a href="atualizar-categoria.jsp?idCat=<%=item.getIdcat()%>">Editar</a>
                        <a href="excluir-categoria.jsp?idCat=<%=item.getIdcat()%>">Excluir</a>
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
