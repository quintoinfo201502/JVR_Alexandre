package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
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
    
    public Vendedor buscarPorChavePrimaria(Long chave){
        return em.find(Vendedor.class, chave);
    }

    public void fechaEmf() {

        Conexao.closeConexao();

    }
}
