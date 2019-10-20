import UIKit

public struct ValidationRuleEqual: ValidationRule {
    
    private let element: ValidatableElement
    public let error: ValidationError
    
    public init(element: ValidatableElement, error: ValidationError) {
        self.element = element
        self.error = error
    }
    
    public func validate<T>(value: T?) -> Bool {
        guard let value = value as? String,
            let textField = element as? UITextField,
            let text = textField.text else {
                return false
        }
        
        return value == text
    }
}
