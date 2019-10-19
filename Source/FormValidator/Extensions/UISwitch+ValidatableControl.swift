import UIKit

extension UISwitch: ValidatableControl {
    
    func validate(rule: ValidationRule) -> ValidationResult {
        return Validator.validate(value: isOn, rule: rule)
    }
    
    func validate(rules: [ValidationRule]) -> ValidationResult {
        return Validator.validate(value: isOn, rules: rules)
    }
}
