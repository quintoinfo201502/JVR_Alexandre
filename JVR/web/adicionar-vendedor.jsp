<%@include file="cabecalho.jsp" %>
<div class="container">
    <h1>Cadastro de Vendedor</h1>

    <div class="container">
        <form action="adicionar-vendedor-ok.jsp" method="post">
            <div class="form-group">
                <label>Nome:</label>
                <input type="text" class="form-control" placeholder="Nome" name="txtNome" /><br />

                <label>Identificador:</label>
                <input type="long" class="form-control" placeholder="ID" name="txtId"/><br />

                <label>Email:</label>
                <input type="email" class="form-control" placeholder="Email" name="txtEmail"/><br />

                <label>Fone:</label>
                <input type="number" class="form-control" placeholder="Fone" name="txtFone"/><br />
            </div>
            <input class="btn btn-default" type="reset" value="Limpar" />
            <input class="btn btn-default" type="submit" value="Adicionar" />
        </form>
    </div>
</div>  
</body>
</html>