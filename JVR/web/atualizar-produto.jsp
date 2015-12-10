<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    String idprod = request.getParameter("idprod");

    ProdutoDAO dao = new ProdutoDAO();
    Produto obj = dao.buscarPorChavePrimaria(Long.parseLong(idprod));
    
    CategoriaDAO cDao = new CategoriaDAO();
    List<Categoria> cLista = cDao.listar();
   
%>

<div class="container">

    <h1>Atualização de Produto</h1>

    <div class="container">
        <form action="atualizar-produto-ok.jsp" method="post">
            <div class="form-group">
                <label>Nome:</label>
                <input type="text" value="<%=obj.getNomeProduto()%>" class="form-control" placeholder="Nome" name="txtNome" /><br />

                <label>Identificador:</label>
                <input type="long" value="<%=obj.getIdprod()%>" class="form-control" placeholder="ID" name="txtId" readonly="readonly"/><br />

                <label>Descrição:</label>
                <input type="text" value="<%=obj.getDescricao()%>" class="form-control" placeholder="Descrição" name="txtDescricao"/><br />

                <label>Tamanho:</label>
                <input type="text" value="<%=obj.getTamanho()%>" class="form-control" placeholder="Tamanho (Ex: 600ml)" name="txtTamanho"/><br />
                
           
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
            <input class="btn btn-default" type="submit" value="Atualizar" />
        </form>

    </div>
</div>
</body>
</html> 