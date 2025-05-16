package vn.hoidanit.laptopshop.repoisitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    CartDetail findByCartAndProduct(Cart cart, Product product); // tìm kiếm chi tiết giỏ hàng theo giỏ hàng và id sản
                                                                 // phẩm

    List<CartDetail> findByCart(Cart cart); // tìm kiếm chi tiết giỏ hàng theo giỏ hàng
    // void deleteByCartAndProduct(Cart cart, Product product); // xóa chi tiết giỏ
    // hàng theo giỏ hàng và id sản phẩm
}
