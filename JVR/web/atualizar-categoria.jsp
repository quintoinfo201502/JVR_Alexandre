<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    String idCat = request.getParameter("idCat");

    CategoriaDAO dao = new CategoriaDAO();
    Categoria obj = dao.buscarPorChavePrimaria(Long.parseLong(idCat));
%>

<div class="container">

    <h1>Atualização de Categoria</h1>

    <div class="container">
        <form action="atualizar-categoria-ok.jsp" method="post">
            <div class="form-group">
                <label>Nome:</label>
                <input type="text" value="<%=obj.getNomeCat()%>" class="form-control" placeholder="Nome" name="txtNome" /><br />

                <label>Identificador:</label>
                <input type="long" value="<%=obj.getIdcat()%>" class="form-control" name="txtId" readonly="readonly" /><br />

                <label>Descrição:</label>
                <input type="text" value="<%=obj.getDescricao()%>" class="form-control" placeholder="Descrição" name="txtDescricao"/><br />
            </div>
            <input class="btn btn-default" type="reset" value="Limpar" />
            <input class="btn btn-default" type="submit" value="Adicionar" />
        </form>

    </div>
</div>
</body>
</html>
