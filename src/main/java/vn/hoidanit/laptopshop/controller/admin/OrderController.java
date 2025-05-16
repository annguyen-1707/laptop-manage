package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.service.ProductService;

@Controller
public class OrderController {
    private final ProductService productService;

    public OrderController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/admin/order")
    public String getDashboard(Model model) {
        List<Order> orders = this.productService.getAllOrders();
        model.addAttribute("orders", orders);
        return "admin/order/show";
    }

    @GetMapping(value = "/admin/order/{id}")
    public String getOrderDetailPage(Model model, @PathVariable long id) {
        Order order = this.productService.getOrderById(id);
        model.addAttribute("order", order);
        return "admin/order/detail";
    }

    @GetMapping("/admin/order/create")
    public String createOrdertPage(Model model) {
        model.addAttribute("newOrder", new Order());
        return "admin/order/create";
    }

    @PostMapping(value = "/admin/order/create")
    public String createOrderPage(Model model,
            @ModelAttribute("newOrder") @Valid Order hoidanit,
            BindingResult newOrderBindingResult,
            @RequestParam("annguyenFile") MultipartFile file) {
        List<FieldError> errors = newOrderBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        // validate
        if (newOrderBindingResult.hasErrors()) {
            return "admin/order/create";
            // ko được thì quay lại trang tạo
        } else {
            return "redirect:/admin/order";
            // được thì quay lai list sp
        }
    }

    @GetMapping("/admin/order/update/{id}")
    public String updateOrderPage(@PathVariable long id, Model model) {
        Order order = this.productService.getOrderById(id);
        model.addAttribute("newOrder", order);
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String updateOrderPage(Model model,
            @ModelAttribute("newOrder") @Valid Order hoidanit,
            BindingResult newOrderBindingResult) {
        List<FieldError> errors = newOrderBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        // validate
        if (newOrderBindingResult.hasErrors()) {

            return "admin/order/update";
            // ko được thì quay lại trang tạo
        } else {
            Order currentOrder = this.productService.getOrderById(hoidanit.getId());
            // currentOrder.setReceiverAddress(hoidanit.getReceiverAddress());
            // currentOrder.setReceiverName(hoidanit.getReceiverName());
            // currentOrder.setReceiverPhone(hoidanit.getReceiverPhone());
            currentOrder.setStatus(hoidanit.getStatus());
            // currentOrder.setTotalPrice(hoidanit.getTotalPrice());
            this.productService.saveOrder(currentOrder);
        }
        return "redirect:/admin/order";
    }

    @GetMapping(value = "/admin/order/delete/{id}") // GET
    public String deleteOrderPage(Model model, @PathVariable long id) {
        model.addAttribute("newOrder", new Order());
        model.addAttribute("id", id);
        return "admin/order/delete";
    }

    @PostMapping(value = "/admin/order/delete/")
    public String deleteOrderPage(Model model, @ModelAttribute("newOrder") Order hoidanit) {
        List<OrderDetail> orderDetails = productService.getOrderDetailByOrderId(hoidanit.getId());
        for (OrderDetail orderDetail : orderDetails) {
            // delete order detail
            this.productService.deleteOrderDetail(orderDetail.getId());
        }
        this.productService.deleteOrder(hoidanit.getId());
        return "redirect:/admin/order";
    }

}
