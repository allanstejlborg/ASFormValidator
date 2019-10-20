import Foundation

public class FormValidator {
    
    private class FormItem {
        let element: ValidatableElement
        var validationRules: [ValidationRule]
        
        init(element: ValidatableElement, validationRules: [ValidationRule]) {
            self.element = element
            self.validationRules = validationRules
        }
    }
    
    private var items: [FormItem] = []
    
    /**
     Validate rules in registered elements.
     */
    public func validate(_ completion: (ValidationResult) -> Void) {
        
        var validationErrors: [ValidationError] = []
        
        items.forEach { item in
            let result = item.element.validate(rules: item.validationRules)
            
            if let element = item.element as? ErrorPresentableElement {
                element.present(validationResult: result)
            }
            
            if case ValidationResult.invalid(let errors) = result {
                validationErrors.append(contentsOf: errors)
            }
        }
        
        completion(validationErrors.isEmpty ? .valid : .invalid(errors: validationErrors))
    }
    
    /**
     Register a validation rule for an element.
     */
    public func register(_ element: ValidatableElement, rule: ValidationRule) {
        
        if let item = items.first(where: { $0.element == element }) {
            item.validationRules.append(rule)
        } else {
            items.append(FormItem(element: element, validationRules: [rule]))
        }
    }
    
    /**
     Register a validation rules for an element by type and error message.
     */
    public func register(_ element: ValidatableElement, type: ValidationType, message: String) {
        
        let rule = Validator.validationRule(for: type, error: ValidationError(message: message))
        register(element, rule: rule)
    }
    
    /**
     Unregister all validation rules for an element.
     */
    public func unregister(_ element: ValidatableElement) {
        
        items.removeAll(where: { $0.element == element })
    }
}
