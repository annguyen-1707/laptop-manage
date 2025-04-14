package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.Role;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping(value = "/admin/product/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/create")
    public String createProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping(value = "/admin/product/create")
    public String createUserPage(Model model,
            @ModelAttribute("newProduct") @Valid Product hoidanit,
            BindingResult newProductBindingResult,
            @RequestParam("annguyenFile") MultipartFile file) {
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        // validate
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
            // ko được thì quay lại trang tạo
        } else {
            String image = this.uploadService.handleUploadFile(file, "product");
            hoidanit.setImage(image);
            this.productService.handleSaveProduct(hoidanit);
            return "redirect:/admin/product";
            // được thì quay lai list sp
        }
    }

    @GetMapping("/admin/product/update/{id}")
    public String updateProductPage(@PathVariable long id, Model model) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("newProduct", product);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String updateProductPage(Model model,
            @ModelAttribute("newProduct") @Valid Product hoidanit,
            BindingResult newProductBindingResult,
            @RequestParam("annguyenFile") MultipartFile file) {
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        // validate
        if (newProductBindingResult.hasErrors()) {

            return "admin/product/update";
            // ko được thì quay lại trang tạo
        } else {
            Product currentProduct = this.productService.getProductById(hoidanit.getId());
            if (file == null || file.isEmpty()) {
                // currentProduct.setImage(currentProduct.getImage());
            } else {
                String image = this.uploadService.handleUploadFile(file, "product");
                currentProduct.setImage(image);
            }
            currentProduct.setName(hoidanit.getName());
            currentProduct.setDetailDesc(hoidanit.getDetailDesc());
            currentProduct.setShortDesc(hoidanit.getShortDesc());
            currentProduct.setPrice(hoidanit.getPrice());
            currentProduct.setQuantity(hoidanit.getQuantity());
            currentProduct.setFactory(hoidanit.getFactory());
            currentProduct.setTarget(hoidanit.getTarget());
            this.productService.updateProduct(currentProduct);
        }
        return "redirect:/admin/product";
    }

    @GetMapping(value = "/admin/product/delete/{id}") // GET
    public String deleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("newProduct", new Product());
        model.addAttribute("id", id);
        return "admin/product/delete";
    }

    @PostMapping(value = "/admin/product/delete/")
    public String deleteProductPage(Model model, @ModelAttribute("newProduct") Product hoidanit) {
        this.productService.deleteProduct(hoidanit.getId());
        return "redirect:/admin/product";
    }
}
