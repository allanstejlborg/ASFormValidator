import Foundation

public class FormValidator {
    
    public typealias Control = ValidatableControl & ErrorPresentableControl
    
    private class FormItem {
        let control: Control
        var validationRules: [ValidationRule]
        
        init(control: Control, validationRules: [ValidationRule]) {
            self.control = control
            self.validationRules = validationRules
        }
    }
    
    private var items: [FormItem] = []
    
    /**
     Validate rules in registered controls.
     */
    public func validate(_ completion: (ValidationResult) -> Void) {
        
        var validationErrors: [ValidationError] = []
        
        items.forEach { item in
            let result = item.control.validate(rules: item.validationRules)
            item.control.present(validationResult: result)
            
            if case ValidationResult.invalid(let errors) = result {
                validationErrors.append(contentsOf: errors)
            }
        }
        
        completion(validationErrors.isEmpty ? .valid : .invalid(errors: validationErrors))
    }
    
    /**
     Register a validation rule for a control.
     */
    public func register(_ control: Control, rule: ValidationRule) {
        
        if let item = items.first(where: { $0.control == control }) {
            item.validationRules.append(rule)
        } else {
            items.append(FormItem(control: control, validationRules: [rule]))
        }
    }
    
    /**
     Register multiple validation rules for a control.
     */
    public func register(_ control: Control, type: ValidationRuleType, message: String) {
        
        let rule = Validator.validationRule(for: type, error: ValidationError(message: message))
        register(control, rule: rule)
    }
}
