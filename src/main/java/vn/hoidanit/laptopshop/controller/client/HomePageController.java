package vn.hoidanit.laptopshop.controller.client;

import java.util.List;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.Role;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserService userService;
    private PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping(value = "/access-deny")
    public String getDenyPage(Model model) {
        return "client/auth/access-deny";
    }

    @GetMapping(value = "/")
    public String getHomePage(Model model, HttpServletRequest request) {
        List<Product> products = productService.getAllProducts();
        List<Product> asusProducts = productService.getProductByFactory("ASUS");
        List<Product> dellProducts = productService.getProductByFactory("DELL");
        List<Product> lgProducts = productService.getProductByFactory("LG");
        List<Product> appleProducts = productService.getProductByFactory("Apple");
        List<Product> lenovoProducts = productService.getProductByFactory("LENOVO");
        List<Product> acerProducts = productService.getProductByFactory("ACER");

        model.addAttribute("products", products);
        model.addAttribute("asusProducts", asusProducts);
        model.addAttribute("dellProducts", dellProducts);
        model.addAttribute("lgProducts", lgProducts);
        model.addAttribute("appleProducts", appleProducts);
        model.addAttribute("lenovoProducts", lenovoProducts);
        model.addAttribute("acerProducts", acerProducts);

        HttpSession session = request.getSession(false);
        return "client/homepage/show";
    }

    @GetMapping(value = "/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String getRegisterPage(
            @ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult BindingResult) {
        List<FieldError> errors = BindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        // validate
        if (BindingResult.hasErrors()) {
            return "client/auth/register";
        } else {
            User user = userService.registerDToUser(registerDTO);
            String hashPassword = this.passwordEncoder.encode(user.getPassword());
            Role role = this.userService.getRoleByName("USER");
            user.setPassword(hashPassword);
            user.setRole(role);
            this.userService.handleSaveUser(user);
            // TODO: process POST request
            return "redirect:/login";
        }
    }

    @GetMapping(value = "/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

}
