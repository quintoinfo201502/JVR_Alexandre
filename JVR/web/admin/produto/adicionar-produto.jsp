<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    CategoriaDAO cDao = new CategoriaDAO();
    List<Categoria> cLista = cDao.listar();
%>

<div class="container">
    <h1>Cadastro de Produtos</h1>

    <div class="container">
        <form action="adicionar-produto-ok.jsp" method="post">
            <div class="form-group">
                <label>Nome:</label>
                <input type="text" class="form-control" placeholder="Nome" name="txtNome" /><br />

                <label>Identificador:</label>
                <input type="number" class="form-control" placeholder="ID" name="txtId"/><br />

                <label>Descrição:</label>
                <input type="text" class="form-control" placeholder="Descrição" name="txtDescricao"/><br />

                <label>Tamanho:</label>
                <input type="text" class="form-control" placeholder="Tamanho (Ex: 600ml)" name="txtTamanho"/><br />

                <label>Selecione:</label>
                <select class="form-control" name="selCategoria">
                    <option value="">Selecione a Categoria</option>
                <%
                    for(Categoria citem : cLista){
                %>
                <option value="<%=citem.getIdcat()%>"><%=citem%></option>
                        
                <%
                    }
                %>
                </select>

            </div>
            <input class="btn btn-default" type="reset" value="Limpar" />
            <input class="btn btn-default" type="submit" value="Adicionar" />
        </form>

    </div>
</div>
</body>
</html>
