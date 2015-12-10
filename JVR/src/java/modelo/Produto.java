
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "produto")
@NamedQueries({
    @NamedQuery(name = "Produto.findAll", query = "SELECT p FROM Produto p"),
    @NamedQuery(name = "Produto.findByName", query = "SELECT p FROM Produto p where p.nomeProduto like :nome")
})
public class Produto implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idprod")
    private Long idprod;
    @Basic(optional = false)
    @Column(name = "tamanho")
    private String tamanho;
    @Basic(optional = false)
    @Column(name = "descricao")
    private String descricao;
    @Basic(optional = false)
    @Column(name = "nome_produto")
    private String nomeProduto;
    @JoinColumn(name = "id", referencedColumnName = "idcat")
    @ManyToOne(optional = false)
    private Categoria categoria;

    public Produto() {
    }

    public Produto(Long idprod) {
        this.idprod = idprod;
    }

    public Produto(Long idprod, String tamanho, String descricao,  String nomeProduto) {
        this.idprod = idprod;
        this.tamanho = tamanho;
        this.descricao = descricao;
       
        this.nomeProduto = nomeProduto;
    }

    public Long getIdprod() {
        return idprod;
    }

    public void setIdprod(Long idprod) {
        this.idprod = idprod;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idprod != null ? idprod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Produto)) {
            return false;
        }
        Produto other = (Produto) object;
        if ((this.idprod == null && other.idprod != null) || (this.idprod != null && !this.idprod.equals(other.idprod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return idprod + " | " + nomeProduto;
    }
    
}
