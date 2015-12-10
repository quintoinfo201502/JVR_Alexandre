package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;
import modelo.Produto;

public class ProdutoDAO {

    EntityManager em;
    
    public ProdutoDAO() throws Exception {
        
        EntityManagerFactory emf;
        
        emf = Conexao.getConexao();
        
        em = emf.createEntityManager();
        
    }
    
    public void incluir(Produto obj) throws Exception {
        
        try {
            
            em.getTransaction().begin();
            
            em.persist(obj);
            
            em.getTransaction().commit();
            
        } catch (RuntimeException e) {
            
            em.getTransaction().rollback();
            
            throw e;
            
        } finally {
            
            em.close();
            
        }
        
    }
    
    public List<Produto> listar() throws Exception {
        
        return em.createNamedQuery("Produto.findAll").getResultList();
        
    }
    
    public List<Produto> listar(String nome) throws Exception {
        TypedQuery<Produto> query = em.createNamedQuery("Produto.findByName", Produto.class);
        
        query.setParameter("nome", '%' + nome + '%');
        return query.getResultList();
    }
    
    public void alterar(Produto obj) throws Exception {
        
        try {
            
            em.getTransaction().begin();
            
            em.merge(obj);
            
            em.getTransaction().commit();
            
        } catch (RuntimeException e) {
            
            em.getTransaction().rollback();
            
            throw e;
            
        } finally {
            
            em.close();
            
        }
        
    }
    
    public void excluir(Produto obj) throws Exception {
        
        try {
            
            em.getTransaction().begin();
            
            em.remove(obj);
            
            em.getTransaction().commit();
            
        } catch (RuntimeException e) {
            
            em.getTransaction().rollback();
            
        } finally {
            
            em.close();
            
        }
        
    }
    
    public Produto buscarPorChavePrimaria(Long chave){
        return em.find(Produto.class, chave);
    }
    
    public void fechaEmf() {
        
        Conexao.closeConexao();
        
    }
}
