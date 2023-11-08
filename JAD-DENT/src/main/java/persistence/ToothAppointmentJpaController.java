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
import model.ToothAppointment;
import persistence.exceptions.NonexistentEntityException;

/**
 *
 * @author gerso
 */
public class ToothAppointmentJpaController implements Serializable {

    public ToothAppointmentJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public ToothAppointmentJpaController() {
        emf = Persistence.createEntityManagerFactory("jad_dent_PU");
    }
    
    public void create(ToothAppointment toothAppointment) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(toothAppointment);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ToothAppointment toothAppointment) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            toothAppointment = em.merge(toothAppointment);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = toothAppointment.getToothAppointmentId();
                if (findToothAppointment(id) == null) {
                    throw new NonexistentEntityException("The toothAppointment with id " + id + " no longer exists.");
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
            ToothAppointment toothAppointment;
            try {
                toothAppointment = em.getReference(ToothAppointment.class, id);
                toothAppointment.getToothAppointmentId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The toothAppointment with id " + id + " no longer exists.", enfe);
            }
            em.remove(toothAppointment);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<ToothAppointment> findToothAppointmentEntities() {
        return findToothAppointmentEntities(true, -1, -1);
    }

    public List<ToothAppointment> findToothAppointmentEntities(int maxResults, int firstResult) {
        return findToothAppointmentEntities(false, maxResults, firstResult);
    }

    private List<ToothAppointment> findToothAppointmentEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ToothAppointment.class));
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

    public ToothAppointment findToothAppointment(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ToothAppointment.class, id);
        } finally {
            em.close();
        }
    }

    public int getToothAppointmentCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ToothAppointment> rt = cq.from(ToothAppointment.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
