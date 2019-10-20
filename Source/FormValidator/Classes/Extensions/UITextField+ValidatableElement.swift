import UIKit

extension UITextField: ValidatableElement {
    
    public func validate(rule: ValidationRule) -> ValidationResult {
        return Validator.validate(value: text, rule: rule)
    }
    
    public func validate(rules: [ValidationRule]) -> ValidationResult {
        return Validator.validate(value: text, rules: rules)
    }
}
