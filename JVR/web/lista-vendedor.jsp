<%@page import="modelo.Vendedor"%>
<%@page import="java.util.List"%>
<%@page import="dao.VendedorDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    VendedorDAO dao = new VendedorDAO();
    
    List<Vendedor> lista = dao.listar();
%>

    <div class="container">
        <h1 class="center-block">Lista de Vendedores</h1>
        
        <div>
            <a href="vendedor.jsp">Voltar</a> <br />
            <form>
                <input type="text" />
                <input type="submit" value="Pesquisar" /><br />
                <table class="table table-bordered">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>Fone</th>
                        
                        <th>Ações</th>
                    </tr>
                    <%
                       for(Vendedor item:lista){
                    %>
                    <tr>
                        <td><%=item.getIdvendedor()%></td>
                        <td><%=item.getNome()%></td>
                        <td><%=item.getEmail()%></td>
                        <td><%=item.getFone()%></td>
                        <td>
                            <a href="atualizar-vendedor.jsp?idVendedor=<%=item.getIdvendedor()%>">Editar</a>
                            <a href="excluir-vendedor.jsp?idVendedor=<%=item.getIdvendedor()%>">Excluir</a>
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
