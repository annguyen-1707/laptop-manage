package vn.hoidanit.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ItemController {
    private final ProductService productService;
    private final UserService userService;

    public ItemController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping(value = "/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "client/product/detail";
    }

    @PostMapping("add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        String email = (String) request.getSession().getAttribute("email");
        long productId = id;
        this.productService.handleAddProductToCart(email, productId, session);
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.getUserByEmail(email);
        Cart cart = this.productService.getCartByUser(user);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("cart", cart);

        double totalPrice = 0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getProduct().getPrice() * cartDetail.getQuantity();
            System.out.println(totalPrice);
        }
        model.addAttribute("totalPrice", totalPrice);
        return "client/cart/show";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String getDeleteCartProductPage(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        CartDetail cartDetail = this.productService.getCartDetailById(id);
        this.productService.handleDeleteProductInCart(cartDetail.getId(), session);
        return "redirect:/cart";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckoutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @GetMapping("/checkout")
    public String getCheckoutPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id);

        Cart cart = this.productService.getCartByUser(currentUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getProduct().getPrice() * cartDetail.getQuantity();
        }
        model.addAttribute("user", currentUser);
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        return "client/cart/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(HttpServletRequest request,
            @RequestParam("address") String address,
            @RequestParam("phone") String phone,
            @RequestParam("fullName") String fullName) {
        // TODO: process POST request
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        User user = this.userService.getUserById(id);
        productService.handlePlaceOrder(user, session, address, phone, fullName);
        return "client/cart/thanks";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        User currentUser = new User(); // null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        List<Order> orders = this.productService.getOrderByUser(currentUser);
        model.addAttribute("orders", orders);

        return "client/cart/order-history";
    }

}
