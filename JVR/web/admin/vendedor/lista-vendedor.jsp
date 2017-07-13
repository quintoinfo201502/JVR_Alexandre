<%@page import="modelo.Vendedor"%>
<%@page import="java.util.List"%>
<%@page import="dao.VendedorDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    VendedorDAO dao = new VendedorDAO();

    List<Vendedor> lista;
    
    if(request.getParameter("txtFiltro")!=null && request.getParameter("txtFiltro")!=""){
        String txtFiltro = request.getParameter("txtFiltro");
        lista = dao.listar(txtFiltro);
    }
    else{
        lista = dao.listar();
    }
%>

<div class="container">
    <h1 class="center-block">Lista de Vendedores</h1>

    <div>
        <a href="vendedor.jsp">Voltar</a> <br />
        <form action="lista-vendedor.jsp" method="post">
            <input type="text" name="txtFiltro" />
            <input type="submit" class="btn btn-default" value="Pesquisar" /> <br />
        </form>  
        <br />
            <table class="table table-bordered">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    

                    <th>Ações</th>
                </tr>
                <%
                    for (Vendedor item : lista) {
                %>
                <tr>
                    <td><%=item.getIdvendedor()%></td>
                    <td><%=item.getNome()%></td>
                    <td><%=item.getEmail()%></td>
                    <td>
                        <a href="atualizar-vendedor.jsp?idVendedor=<%=item.getIdvendedor()%>">Editar</a>
                        <a href="excluir-vendedor.jsp?idVendedor=<%=item.getIdvendedor()%>">Excluir</a>
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
