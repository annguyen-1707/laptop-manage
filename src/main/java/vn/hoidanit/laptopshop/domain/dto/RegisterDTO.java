package vn.hoidanit.laptopshop.domain.dto;

import jakarta.validation.constraints.Email;
import vn.hoidanit.laptopshop.service.validator.RegisterChecked;
import vn.hoidanit.laptopshop.service.validator.StrongPassword;

@RegisterChecked
public class RegisterDTO {
    private String firstName;
    private String lastName;
    private String email;
    @StrongPassword(message = "Password must contain at least 8 characters, 1 uppercase letter, 1 lowercase letter, 1 digit, and 1 special character")
    private String password;
    private String confirmPassword;

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

}
