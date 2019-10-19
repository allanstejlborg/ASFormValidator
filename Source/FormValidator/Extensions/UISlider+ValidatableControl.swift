import UIKit

extension UISlider: ValidatableControl {
    
    func validate(rule: ValidationRule) -> ValidationResult {
        return Validator.validate(value: value, rule: rule)
    }
    
    func validate(rules: [ValidationRule]) -> ValidationResult {
        return Validator.validate(value: value, rules: rules)
    }
}
