package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Role;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.uploadService = uploadService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping(value = "/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping(value = "/admin/user/create") // GET
    public String createUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") @Valid User hoidanit,
            BindingResult newUserBindingResult,
            @RequestParam("annguyenFile") MultipartFile file) {
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        // validate
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        } else {
            String avatar = this.uploadService.handleUploadFile(file, "avatar");
            String hashPassword = this.passwordEncoder.encode(hoidanit.getPassword());
            Role role = this.userService.getRoleByName(hoidanit.getRole().getName());
            hoidanit.setAvatar(avatar);
            hoidanit.setPassword(hashPassword);
            hoidanit.setRole(role);
            this.userService.handleSaveUser(hoidanit);
            return "redirect:/admin/user";
        }

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
    public String updateUserPage(Model model,
            @ModelAttribute("newUser") @Valid User hoidanit,
            BindingResult newUserBindingResult,
            @RequestParam("annguyenFile") MultipartFile file) {
        List<FieldError> allErrors = newUserBindingResult.getFieldErrors();
        List<FieldError> errors = allErrors.stream()
                .filter(error -> !error.getField().equals("email") && !error.getField().equals("password"))
                .toList();

        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        // validate
        if (!errors.isEmpty()) {
            return "admin/user/update";
            // ko được thì quay lại trang tạo
        } else {
            User currentUser = this.userService.getUserById(hoidanit.getId());
            currentUser.setFullName(hoidanit.getFullName());
            currentUser.setAddress(hoidanit.getAddress());
            currentUser.setPhone(hoidanit.getPhone());
            if (file == null || file.isEmpty()) {
                // currentUser.setAvatar(currentUser.getAvatar());
            } else {
                String avatar = this.uploadService.handleUploadFile(file, "avatar");
                currentUser.setAvatar(avatar);
            }
            // if (!hoidanit.getPassword().isEmpty()) {
            // String hashPassword = this.passwordEncoder.encode(hoidanit.getPassword());
            // currentUser.setPassword(hashPassword);
            // }
            Role role = this.userService.getRoleByName(hoidanit.getRole().getName());
            currentUser.setRole(role);
            this.userService.updatUser(currentUser);
            return "redirect:/admin/user";
        }
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
