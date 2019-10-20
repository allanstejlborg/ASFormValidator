import UIKit

extension UISlider: ValidatableElement {
    
    public func validate(rule: ValidationRule) -> ValidationResult {
        return Validator.validate(value: value, rule: rule)
    }
    
    public func validate(rules: [ValidationRule]) -> ValidationResult {
        return Validator.validate(value: value, rules: rules)
    }
}
