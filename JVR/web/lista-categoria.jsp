<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    CategoriaDAO dao = new CategoriaDAO();
    
    List<Categoria> lista = dao.listar();
%>

    <div class="container">
        <h1 class="center-block">Lista de Categorias</h1>
        
        <div>
            <a href="categoria.jsp">Voltar</a> <br />
            <form>
                <input type="text" />
                <input type="submit" value="Pesquisar" /><br />
                <table class="table table-bordered">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        
                        <th>Ações</th>
                    </tr>
                    <%
                       for(Categoria item:lista){
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
            </form>
        </div>
    </div>

    </body>
</html>
