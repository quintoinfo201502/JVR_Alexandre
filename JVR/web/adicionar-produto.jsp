<%@include file="cabecalho.jsp"%>
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

            </div>
            <input class="btn btn-default" type="reset" value="Limpar" />
            <input class="btn btn-default" type="submit" value="Adicionar" />
        </form>

    </div>
</div>
</body>
</html>
