package vn.hoidanit.laptopshop.repoisitory;

import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.User;

import java.util.List;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user); // tìm kiếm giỏ hàng theo người dùng
}
