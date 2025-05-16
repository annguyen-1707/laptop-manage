package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repoisitory.CartDetailRepository;
import vn.hoidanit.laptopshop.repoisitory.CartRepository;
import vn.hoidanit.laptopshop.repoisitory.OrderDetailRepository;
import vn.hoidanit.laptopshop.repoisitory.OrderRepository;
import vn.hoidanit.laptopshop.repoisitory.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService,
            OrderDetailRepository orderDetailRepository, OrderRepository orderRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id).orElse(null);
    }

    public List<Product> getProductByFactory(String factory) {
        return this.productRepository.findByFactory(factory);
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    public Product handleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public void deleteProduct(long id) {
        this.productRepository.deleteById(id);
    }

    public Product updateProduct(Product product) {
        return this.productRepository.save(product);
    }

    public void handleAddProductToCart(String email, long id, HttpSession session) {
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                cart = new Cart();
                cart.setUser(user);
                cart.setSum(0);
                this.cartRepository.save(cart);
            }
            // save cart detail
            // tim product
            Product product = this.productRepository.findById(id).orElse(null);
            if (product != null) {
                // check if product is already in cart detail
                CartDetail cartDetail = this.cartDetailRepository.findByCartAndProduct(cart, product);
                if (cartDetail != null) {
                    // update quantity and price
                    cartDetail.setQuantity(cartDetail.getQuantity() + 1);
                    cartDetail.setPrice(cartDetail.getPrice() + product.getPrice());
                    this.cartDetailRepository.save(cartDetail);
                } else {
                    cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(product);
                    cartDetail.setQuantity(1);
                    cartDetail.setPrice(product.getPrice());
                    this.cartDetailRepository.save(cartDetail);
                    // update cart sum
                    cart.setSum(cart.getSum() + 1);
                    session.setAttribute("sum", cart.getSum());
                    this.cartRepository.save(cart);
                }
            }
        }
    }

    public Cart getCartByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public CartDetail getCartDetailByProductIdAndUserId(long productId, long userId) {
        User user = this.userService.getUserById(userId);
        Cart cart = this.cartRepository.findByUser(user);
        Product product = this.productRepository.findById(productId).orElse(null);
        if (cart != null && product != null) {
            return this.cartDetailRepository.findByCartAndProduct(cart, product);
        }
        return null;
    }

    public CartDetail getCartDetailById(long id) {
        return this.cartDetailRepository.findById(id).orElse(null);
    }

    public void handleDeleteProductInCart(Long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOPtional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOPtional.isPresent()) {
            CartDetail cartDetail = cartDetailOPtional.get();
            Cart currentCart = cartDetail.getCart();

            this.cartDetailRepository.delete(cartDetail);

            if (currentCart.getSum() > 1) {
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                this.cartRepository.delete(currentCart);
                session.setAttribute("sum", 0);
            }
        }

    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> optional = this.cartDetailRepository.findById(cartDetail.getId());
            if (optional.isPresent()) {
                CartDetail cartDetail1 = optional.get();
                cartDetail1.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(cartDetail1);
            }
        }
    }

    public void handlePlaceOrder(User user, HttpSession session, String address, String phone, String fullname) {
        // create order
        Order order = new Order();
        order.setUser(user);
        order.setReceiverAddress(address);
        order.setReceiverName(fullname);
        order.setReceiverPhone(phone);
        order.setStatus("Pending");
        this.orderRepository.save(order);
        double totalPrice = 0;
        // create order detail
        // STEP 1: get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();
            if (cartDetails != null) {
                for (CartDetail cartDetail : cartDetails) {
                    totalPrice += cartDetail.getPrice();
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cartDetail.getProduct());
                    orderDetail.setQuantity(cartDetail.getQuantity());
                    orderDetail.setPrice(cartDetail.getPrice());
                    this.orderDetailRepository.save(orderDetail);
                }
            }

            order.setTotalPrice(totalPrice);
            this.orderRepository.save(order);

            // step 2 update product quantity
            for (CartDetail cartDetail : cartDetails) {
                Product product = cartDetail.getProduct();
                product.setQuantity(product.getQuantity() - cartDetail.getQuantity());
                this.productRepository.save(product);
            }

            // step 3
            // delete cart adn cart detail
            for (CartDetail cartDetail : cartDetails) {
                this.cartDetailRepository.delete(cartDetail);
            }
            this.cartRepository.delete(cart);

            // step 4 update session
            session.setAttribute("sum", 0);

        }
    }

    public List<Order> getAllOrders() {
        return this.orderRepository.findAll();
    }

    public Order getOrderById(long id) {
        return this.orderRepository.findById(id).orElse(null);
    }

    public void deleteOrder(long id) {
        this.orderRepository.deleteById(id);
    }

    public void saveOrder(Order order) {
        this.orderRepository.save(order);
    }

    public List<OrderDetail> getOrderDetailByOrderId(long orderId) {
        return this.orderDetailRepository.findByOrderId(orderId);
    }

    public void deleteOrderDetail(long id) {
        this.orderDetailRepository.deleteById(id);
    }

    public List<Order> getOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }
}
