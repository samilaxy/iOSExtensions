    //
    //  Validations.swift
    //  AegisRider-iOS
    //
    //  Created by Abdul Suraj on 11/01/2022.
    //

import Foundation

enum  ValidateType {
    case incorrectPassword
    case password
    case confirmPassword
    case success
}
enum  SignUpValidateType {
    case incorrectPassword
    case email
    case password
    case confirmPassword
    case success
}
enum  LoginValidateType {
    case email
    case password
    case success
}

class Validations {
    static let shared = Validations()
    func validatePassword(password: String) -> Bool {
            //  regex for password validations
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       "^{1}(?:.){6,}$")
        return passwordTest.evaluate(with: password)
    }
    func validateEmail(email: String) -> Bool {
            // regex for email validations
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }
    func validateCode(code: String) -> Bool {
            //  regex for sent code validations
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "[0-9]{6,6}$")
        return emailTest.evaluate(with: code)
    }
    
    func validateEditProfile(_ fullName: String?) ->  (Bool, String) {
        guard let userName = fullName else {
            return (false, TextsInUse.FullName)
        }
        if userName.isEmpty {
            return (false, TextsInUse.FullName)
        }
            
        return (true, "")
    }
        // email textfields validation
    func validateOneEmail(_ email: String?) -> (Bool, String) {
        guard let userEmail = email else {
            return (false, TextsInUse.InvalidEmail)
        }
        if userEmail.isEmpty || !validateEmail(email: userEmail) {
            return (false, TextsInUse.InvalidEmail)
        }
        return (true, "")
    }
        // one textfield validation
    func validateOnePassword (_ password: String?) -> (Bool, String) {
        guard let userPassword = password else {
            return (false, TextsInUse.InvalidPassword)
        }
        if userPassword.isEmpty || !validatePassword(password: userPassword) {
            return (false, TextsInUse.InvalidPassword)
        }
        return (true, "")
    }
        // two textfields validation
    func validateTwoPasswords(_ password: String?, _ confirmPassword: String?) -> (Bool, String, ValidateType) {
        guard  let userPassword = password, let userConfirmpassword = confirmPassword else {
            return (false, TextsInUse.InvalidPassword, .incorrectPassword)
        }
        if userPassword.isEmpty || !validatePassword(password: userPassword) {
            return (false, TextsInUse.InvalidPassword, .password)
        }
        if userPassword != userConfirmpassword {
            return (false, TextsInUse.Passwordmismatch, .confirmPassword)
        }
        return (true, "", .success)
    }
        // sent code validation
    func validateSentCode(_ code: String?) -> (Bool, String) {
        guard let userCode = code else {
            return (false, TextsInUse.InvalidCode)
        }
        if userCode.isEmpty || !validateCode(code: userCode) {
            return (false, TextsInUse.InvalidCode)
        }
        return (true, "")
    }
        //  login validation
    func validateLogin(_ email: String?, _ password: String?) -> (Bool, String, LoginValidateType) {
        guard  let userEmail = email, let userPassword = password else {
            return (false, TextsInUse.InvalidEmail, .email)
        }
        if userEmail.isEmpty || !validateEmail(email: userEmail) {
            return (false, TextsInUse.InvalidEmail, .email)
        }
        if userPassword.isEmpty || !validatePassword(password: userPassword) {
            return (false, TextsInUse.InvalidPassword,  .password)
        }
        return (true, "", .success)
    }
        //  login validation
    func validateSignUp(_ email: String?, _ password: String?,_ confirmPassword: String?) -> (Bool, String, SignUpValidateType) {
        guard  let userEmail = email, let userPassword = password, let userConfirmpassword = confirmPassword else {
            return (false, TextsInUse.InvalidEmail, .email)
        }
        if userEmail.isEmpty || !validateEmail(email: userEmail) {
            return (false, TextsInUse.InvalidEmail, .email)
        }
        if userPassword.isEmpty || !validatePassword(password: userPassword) {
            return (false, TextsInUse.InvalidPassword,  .password)
        }
        if userPassword != userConfirmpassword {
            return (false, TextsInUse.Passwordmismatch, .confirmPassword)
        }
        return (true, "", .success)
    }
}
