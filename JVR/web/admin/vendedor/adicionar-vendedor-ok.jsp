<%@page import="modelo.Vendedor"%>
<%@page import="dao.VendedorDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    if (request.getParameter("txtId") == null
            || request.getParameter("txtNome") == null
            || request.getParameter("txtEmail") == null
            || request.getParameter("txtSenha") == null) {
        response.sendRedirect("vendedor.jsp");
    } else {

        String idvendedor = request.getParameter("txtId");
        String nome = request.getParameter("txtNome");
        String email = request.getParameter("txtEmail");
        String senha = request.getParameter("txtSenha");

        VendedorDAO dao = new VendedorDAO();

        Vendedor obj = new Vendedor();

        obj.setNome(nome);
        obj.setIdvendedor(Long.parseLong(idvendedor));
        obj.setEmail(email);
        obj.setSenha(senha);

        try {
            dao.incluir(obj);
            msg = "Registro cadastrado com sucesso";

        } catch (Exception ex) {
            msg = "Erro ao cadastrar registro";
        }

    }

%>


<div class="container">
    <h1 class="center-block">Cadastro de Vendedor</h1>
    <%=msg%>. <br />
    <a href="lista-vendedor.jsp">Voltar para a Listagem</a>

</div>

</body>
</html>
