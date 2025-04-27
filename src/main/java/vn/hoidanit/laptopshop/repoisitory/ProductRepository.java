package vn.hoidanit.laptopshop.repoisitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    // JpaRepository<Product, Long> là interface của Spring Data JPA
    // nó sẽ tự động tạo ra các phương thức để truy cập vào cơ sở dữ liệu
    // Product là tên của entity, Long là kiểu dữ liệu của id trong entity
    // không cần phải viết các phương thức như save, findById, findAll, deleteById,
    // ... nữa
    // vì nó đã có sẵn trong JpaRepository rồi
    List<Product> findByName(String name); // tìm kiếm sản phẩm theo tên

    Product save(Product product); // lưu sản phẩm

    List<Product> findAll(); // tìm tất cả sản phẩm

    List<Product> findByFactory(String factory); // tìm kiếm sản phẩm theo hãng sản xuất

}
