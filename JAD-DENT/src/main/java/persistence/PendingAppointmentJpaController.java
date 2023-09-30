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
import model.PendingAppointment;
import persistence.exceptions.NonexistentEntityException;

/**
 *
 * @author gerso
 */
public class PendingAppointmentJpaController implements Serializable {

    public PendingAppointmentJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public PendingAppointmentJpaController() {
        emf = Persistence.createEntityManagerFactory("jad_dent_PU");
    }


    public void create(PendingAppointment pendingAppointment) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(pendingAppointment);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(PendingAppointment pendingAppointment) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            pendingAppointment = em.merge(pendingAppointment);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = pendingAppointment.getPendingAppointmentId();
                if (findPendingAppointment(id) == null) {
                    throw new NonexistentEntityException("The pendingAppointment with id " + id + " no longer exists.");
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
            PendingAppointment pendingAppointment;
            try {
                pendingAppointment = em.getReference(PendingAppointment.class, id);
                pendingAppointment.getPendingAppointmentId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The pendingAppointment with id " + id + " no longer exists.", enfe);
            }
            em.remove(pendingAppointment);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<PendingAppointment> findPendingAppointmentEntities() {
        return findPendingAppointmentEntities(true, -1, -1);
    }

    public List<PendingAppointment> findPendingAppointmentEntities(int maxResults, int firstResult) {
        return findPendingAppointmentEntities(false, maxResults, firstResult);
    }

    private List<PendingAppointment> findPendingAppointmentEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(PendingAppointment.class));
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

    public PendingAppointment findPendingAppointment(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(PendingAppointment.class, id);
        } finally {
            em.close();
        }
    }

    public int getPendingAppointmentCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<PendingAppointment> rt = cq.from(PendingAppointment.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
