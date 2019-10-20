//
//  ViewController.swift
//  Example
//
//  Created by Allan Stejlborg on 19/10/2019.
//  Copyright © 2019 Allan Stejlborg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var termsSwitch: UISwitch!
    
    private var validator: FormValidator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "FormValidator"
        setupValidator()
    }

    private func setupValidator() {
        validator = FormValidator()
        validator.register(nameTextField, type: .required, message: "The name field is required")
        validator.register(emailTextField, type: .email, message: "The e-mail address must be valid")
        validator.register(ageTextField, type: .numericMin(18), message: "Age must be 18 or above")
        validator.register(passwordTextField, type: .minLength(8), message: "Password must be min. 8 characters")
        validator.register(passwordConfirmationTextField, type: .required, message: "Confirmation password is required")
        validator.register(passwordConfirmationTextField, type: .equal(passwordTextField), message: "Confirmation password does not match")
        validator.register(priceTextField, type: .decimalRange(1, 100), message: "Price must be a decimal number between 1 and 100")
        validator.register(termsSwitch, type: .boolean(true), message: "The terms must be accepted")
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        validator.validate { result in
            if case ValidationResult.invalid(let errors) = result {
                errors.forEach { print("\($0.message)") }
            } else {
                print("Valid!")
            }
        }
    }

}

extension UITextField: ErrorPresentableControl {
    public func present(validationResult: ValidationResult) {
        if case ValidationResult.invalid = validationResult {
            backgroundColor = .red
        } else {
            backgroundColor = .clear
        }
    }
}

extension UISwitch: ErrorPresentableControl {
    public func present(validationResult: ValidationResult) {
    }
}

