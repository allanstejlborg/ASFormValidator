import Foundation

public struct ValidationRuleEqual: ValidationRule {
    
    private let control: ValidatableControl
    public let error: ValidationError
    
    public init(control: ValidatableControl, error: ValidationError) {
        self.control = control
        self.error = error
    }
    
    public func validate<T>(value: T?) -> Bool {
        guard let value = value as? String,
            let textField = control as? UITextField,
            let text = textField.text else {
                return false
        }
        
        return value == text
    }
}
