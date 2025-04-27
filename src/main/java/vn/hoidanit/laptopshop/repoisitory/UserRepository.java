package vn.hoidanit.laptopshop.repoisitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User hoidanit);

    List<User> findByEmail(String email);

    User findFirstByEmail(String email); // lấy 1 người đầu tiên có email đó

    User findTop1ByEmail(String email);// lấy 1 người đầu tiên có email đó

    boolean existsByEmail(String email); // kiểm tra xem có tồn tại email đó hay không
}
