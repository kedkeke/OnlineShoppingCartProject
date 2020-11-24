/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author kedke
 */
public class CartTable {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
    
    public static List<Cart> findAllCart() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        List<Cart> cartList = null;
        try {
            cartList = (List<Cart>) em.createNamedQuery("Cart.findAll").getResultList();
            //em.close();

        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        } finally {
            em.close();
            emf.close();
        }
        return cartList;
    }

    public static Cart findCartById(int id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        Cart cart = null;
        try {
            cart = em.find(Cart.class, id);
            //em.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            em.close();
            emf.close();
        }
        return cart;
    }

    public static List<Cart> findCartByIdCatalog(Catalog idcatalog) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        List<Cart> cart = null;
        try {
            Query query = em.createNamedQuery("Cart.findByIdCatalog");
            query.setParameter("idcatalog", idcatalog);
            cart = (List<Cart>) query.getResultList();
            if (cart.isEmpty()) {
                return null;
            }
            //em.close();

        } catch (Exception e) {
    
            throw new RuntimeException(e);
        } finally {
            em.close();
            emf.close();
        }
        return cart;
    }

    public static int updateCart(Cart cart) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Cart target = em.find(Cart.class, cart.getId());
            if (target == null) {
                return 0;
            }
            target.setQuantity(cart.getQuantity());
            em.persist(target);
            em.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);

        } finally {
            em.close();
            emf.close();
        }
        return 1;

    }

    public static int removeCart(int id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Cart target = em.find(Cart.class, id);
            if (target == null) {
                return 0;
            }
            em.remove(target);
            em.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);

        } finally {
            em.close();
            emf.close();
        }
        return 1;
    }

    public static int insertCart(Cart cart) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(cart);
            em.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);

        } finally {
            em.close();
            emf.close();
        }
        return 1;
    }

    public void persist(Object object) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }
}
