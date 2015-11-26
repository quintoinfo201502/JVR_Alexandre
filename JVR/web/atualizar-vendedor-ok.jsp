<%@page import="modelo.Vendedor"%>
<%@page import="dao.VendedorDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    String idVendedor = request.getParameter("txtId");
    String nome = request.getParameter("txtNome");
    String email = request.getParameter("txtEmail");
    String fone = request.getParameter("txtFone");
    
    VendedorDAO dao = new VendedorDAO();
    Vendedor obj = dao.buscarPorChavePrimaria(Long.parseLong(idVendedor));
    
    obj.setNome(nome);
    obj.setIdvendedor(Long.parseLong(idVendedor));
    obj.setEmail(email);
    obj.setFone(fone);
    
    dao.alterar(obj);
%>

<div class="container">
    <h1 class="center-block">Atualização de Vendedores</h1>
    <div class="container">
        O Registro <%=idVendedor%> foi alterado com sucesso. <br />
        <a href="lista-vendedor.jsp">Voltar para a Listagem</a>
        
    </div>
</body>
</html>
