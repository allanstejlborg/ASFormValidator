import UIKit

public protocol ValidatableControl where Self: UIControl {
    func validate(rule: ValidationRule) -> ValidationResult
    func validate(rules: [ValidationRule]) -> ValidationResult
}
