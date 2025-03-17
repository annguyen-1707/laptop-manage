package vn.hoidanit.laptopshop.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "order_details")
public class Order_detail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private int quantity;
    private double price;

    // many order_detail -> 1 order

    // order_id is a foreign key in order_details table
    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    // many order_detail -> 1 product
    // product_id is a foreign key in order_details table
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
}
