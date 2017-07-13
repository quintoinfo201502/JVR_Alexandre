package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;
import modelo.Vendedor;

public class VendedorDAO {

    EntityManager em;

    public VendedorDAO() throws Exception {

        EntityManagerFactory emf;

        emf = Conexao.getConexao();

        em = emf.createEntityManager();

    }

    public void incluir(Vendedor obj) throws Exception {

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

    public List<Vendedor> listar() throws Exception {

        return em.createNamedQuery("Vendedor.findAll").getResultList();

    }
    
    public List<Vendedor> listar(String nome) throws Exception {
        TypedQuery<Vendedor> query = em.createNamedQuery("Vendedor.findByName", Vendedor.class);
        
        query.setParameter("nome", '%' + nome + '%');
        return query.getResultList();
    }

    public void alterar(Vendedor obj) throws Exception {

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

    public void excluir(Vendedor obj) throws Exception {

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
    
    public Vendedor realizarLogin(String nome, String senha){
        TypedQuery<Vendedor> query =
                em.createNamedQuery("Vendedor.realizarLogin", Vendedor.class);
        
        query.setParameter("nome", nome);
        query.setParameter("senha", senha);
        Vendedor util;
        try {
            util = query.getSingleResult();
        } catch(Exception e){
            util = null;
        }
        
        return util;
    }
    
    
    public Vendedor buscarPorChavePrimaria(Long chave){
        return em.find(Vendedor.class, chave);
    }

    public void fechaEmf() {

        Conexao.closeConexao();

    }
}
