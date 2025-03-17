package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserControlller {
    private final UserService userService;
    private final UploadService uploadService;

    public UserControlller(UserService userService, UploadService uploadService) {
        this.uploadService = uploadService;
        this.userService = userService;
    }

    @GetMapping(value = "/admin/user/create") // GET
    public String createUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") User hoidanit,
            @RequestParam("annguyenFile") MultipartFile file) {

        String avatar = this.uploadService.handleUploadFile(file, "avatar");
        System.out.println("avatar:" + avatar);
        // this.userService.handleSaveUser(hoidanit);
        return "redirect:/admin/user";
    }

    @GetMapping(value = "/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping(value = "/admin/user/delete/{id}") // GET
    public String deleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("newUser", new User());
        model.addAttribute("id", id);
        return "admin/user/delete";
    }

    @PostMapping(value = "/admin/user/delete/")
    public String deleteUserPage(Model model, @ModelAttribute("newUser") User hoidanit) {
        this.userService.deleteUser(hoidanit.getId());
        return "redirect:/admin/user";
    }

    @GetMapping(value = "/admin/user/update/{id}") // GET
    public String updateUserPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("newUser", user);
        return "/admin/user/update";
    }

    @PostMapping(value = "/admin/user/update") // POST
    public String updateUserPage(Model model, @ModelAttribute("newUser") User hoidanit) {
        User currentUser = this.userService.getUserById(hoidanit.getId());
        if (currentUser != null) {
            currentUser.setFullName(hoidanit.getFullName());
            currentUser.setAddress(hoidanit.getAddress());
            currentUser.setPhone(hoidanit.getPhone());
        }
        this.userService.updatUser(currentUser);
        return "redirect:/admin/user";
    }

}

// @RestController
// public class UserControlller {

// private UserService userService;

// public UserControlller(UserService userService) {
// this.userService = userService;
// }

// @GetMapping("/")
// public String getHomePage() {
// return this.userService.handleHello();
// }
// }
