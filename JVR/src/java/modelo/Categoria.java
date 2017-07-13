/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author alexandre
 */
@Entity
@Table(name = "categoria")
@NamedQueries({
    @NamedQuery(name = "Categoria.findAll", query = "SELECT c FROM Categoria c"),
    @NamedQuery(name = "Categoria.findByName", query = "SELECT c FROM Categoria c where c.nomeCat like :nome"),
    @NamedQuery(name = "Categoria.findByIdcat", query = "SELECT c FROM Categoria c WHERE c.idcat = :idcat"),
    @NamedQuery(name = "Categoria.findByNomeCat", query = "SELECT c FROM Categoria c WHERE c.nomeCat = :nomeCat"),
    @NamedQuery(name = "Categoria.findByDescricao", query = "SELECT c FROM Categoria c WHERE c.descricao = :descricao")})
public class Categoria implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idcat")
    private Long idcat;
    @Basic(optional = false)
    @Column(name = "nome_cat")
    private String nomeCat;
    @Basic(optional = false)
    @Column(name = "descricao")
    private String descricao;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idcat")
    private List<Produto> produtoList;

    public Categoria() {
    }

    public Categoria(Long idcat) {
        this.idcat = idcat;
    }

    public Categoria(Long idcat, String nomeCat, String descricao) {
        this.idcat = idcat;
        this.nomeCat = nomeCat;
        this.descricao = descricao;
    }

    public Long getIdcat() {
        return idcat;
    }

    public void setIdcat(Long idcat) {
        this.idcat = idcat;
    }

    public String getNomeCat() {
        return nomeCat;
    }

    public void setNomeCat(String nomeCat) {
        this.nomeCat = nomeCat;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public List<Produto> getProdutoList() {
        return produtoList;
    }

    public void setProdutoList(List<Produto> produtoList) {
        this.produtoList = produtoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcat != null ? idcat.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Categoria)) {
            return false;
        }
        Categoria other = (Categoria) object;
        if ((this.idcat == null && other.idcat != null) || (this.idcat != null && !this.idcat.equals(other.idcat))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return nomeCat + " | " + idcat;
    }

}
