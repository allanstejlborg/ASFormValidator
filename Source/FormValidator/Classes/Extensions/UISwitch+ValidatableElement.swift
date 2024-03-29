import UIKit

extension UISwitch: ValidatableElement {
    
    public func validate(rule: ValidationRule) -> ValidationResult {
        return Validator.validate(value: isOn, rule: rule)
    }
    
    public func validate(rules: [ValidationRule]) -> ValidationResult {
        return Validator.validate(value: isOn, rules: rules)
    }
}
