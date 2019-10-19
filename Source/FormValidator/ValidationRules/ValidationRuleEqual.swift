import Foundation

struct ValidationRuleEqual: ValidationRule {
    
    let control: ValidatableControl
    let error: ValidationError
    
    public init(control: ValidatableControl, error: ValidationError) {
        self.control = control
        self.error = error
    }
    
    func validate<T>(value: T?) -> Bool {
        guard let value = value as? String,
            let textField = control as? UITextField,
            let text = textField.text else {
                return false
        }
        
        return value == text
    }
}
