import UIKit

public protocol ValidatableElement where Self: NSObject {
    func validate(rule: ValidationRule) -> ValidationResult
    func validate(rules: [ValidationRule]) -> ValidationResult
}
