/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistence;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import model.UserAdmin;
import persistence.exceptions.NonexistentEntityException;

/**
 *
 * @author gerso
 */
public class UserAdminJpaController implements Serializable {

    public UserAdminJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public UserAdminJpaController() {
        emf = Persistence.createEntityManagerFactory("jad_dent_PU");
    }

    public void create(UserAdmin userAdmin) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(userAdmin);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(UserAdmin userAdmin) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            userAdmin = em.merge(userAdmin);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = userAdmin.getUserId();
                if (findUserAdmin(id) == null) {
                    throw new NonexistentEntityException("The userAdmin with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            UserAdmin userAdmin;
            try {
                userAdmin = em.getReference(UserAdmin.class, id);
                userAdmin.getUserId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The userAdmin with id " + id + " no longer exists.", enfe);
            }
            em.remove(userAdmin);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<UserAdmin> findUserAdminEntities() {
        return findUserAdminEntities(true, -1, -1);
    }

    public List<UserAdmin> findUserAdminEntities(int maxResults, int firstResult) {
        return findUserAdminEntities(false, maxResults, firstResult);
    }

    private List<UserAdmin> findUserAdminEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(UserAdmin.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public UserAdmin findUserAdmin(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(UserAdmin.class, id);
        } finally {
            em.close();
        }
    }

    public int getUserAdminCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<UserAdmin> rt = cq.from(UserAdmin.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
