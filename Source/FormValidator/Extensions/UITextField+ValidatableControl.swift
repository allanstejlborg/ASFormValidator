import UIKit

extension UITextField: ValidatableControl {
    
    func validate(rule: ValidationRule) -> ValidationResult {
        return Validator.validate(value: text, rule: rule)
    }
    
    func validate(rules: [ValidationRule]) -> ValidationResult {
        return Validator.validate(value: text, rules: rules)
    }
}
