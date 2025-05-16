package vn.hoidanit.laptopshop.domain;

import java.util.List;

import jakarta.annotation.Generated;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.persistence.Column;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank(message = "Tên sản phẩm không được để trống")
    private String name;
    @NotBlank(message = "Mô tả sản phẩm không được để trống")
    @Column(columnDefinition = "MediumText")
    private String detailDesc;

    @NotBlank(message = "Mô tả sản phẩm không được để trống")
    private String shortDesc;
    private String image;
    @DecimalMin(value = "0.0", inclusive = false, message = "Giá sản phẩm > 0")
    private double price;

    @Min(value = 1, message = "Số lượng sản phẩm > 1")
    private int quantity;
    private long sold;
    private String factory;
    private String target;

    // 1 product -> many order_detail
    @OneToMany(mappedBy = "product")
    private List<OrderDetail> order_details;

    // 1 product -> many cart_detail
    @OneToMany(mappedBy = "product")
    private List<CartDetail> cartDetails;

    public Product() {
    }

    public Product(String name, String detailDesc, String shortDesc, String image, double price, int quantity,
            long sold, String factory, String target) {
        this.name = name;
        this.detailDesc = detailDesc;
        this.shortDesc = shortDesc;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.sold = sold;
        this.factory = factory;
        this.target = target;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public long getSold() {
        return sold;
    }

    public void setSold(long sold) {
        this.sold = sold;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", detailDesc=" + detailDesc + ", shortDesc=" + shortDesc
                + ", image=" + image + ", price=" + price + ", quantity=" + quantity + ", sold=" + sold + ", factory="
                + factory + ", target=" + target + "]";
    }

}
