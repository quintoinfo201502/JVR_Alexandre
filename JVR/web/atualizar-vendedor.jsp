<%@page import="modelo.Vendedor"%>
<%@page import="dao.VendedorDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    String idVendedor = request.getParameter("idVendedor");

    VendedorDAO dao = new VendedorDAO();
    Vendedor obj = dao.buscarPorChavePrimaria(Long.parseLong(idVendedor));
%>

<div class="container">

    <h1>Atualização de Vendedor</h1>

    <div class="container">
        <form action="atualizar-vendedor-ok.jsp" method="post">
            <div class="form-group">
                <label>Nome:</label>
                <input type="text" value="<%=obj.getNome()%>" class="form-control" placeholder="Nome" name="txtNome" /><br />

                <label>Identificador:</label>
                <input type="long" value="<%=obj.getIdvendedor()%>" class="form-control" name="txtId" readonly="readonly" /><br />

                <label>Email:</label>
                <input type="text" value="<%=obj.getEmail()%>" class="form-control" placeholder="Email" name="txtEmail"/><br />

                <label>Fone:</label>
                <input type="number" value="<%=obj.getFone()%>" class="form-control" placeholder="Fone" name="txtFone"/><br />
            </div>
            <input class="btn btn-default" type="submit" value="Adicionar" />
        </form>

    </div>
</div>
</body>
</html>
