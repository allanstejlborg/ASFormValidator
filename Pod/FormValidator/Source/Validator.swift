import Foundation

public class Validator {
    
    public static func validationRule(for type: ValidationRuleType, error: ValidationError) -> ValidationRule {
        
        switch type {
        case .required:
            return ValidationRuleRequired(error: error)
        case .minLenght(let minLength):
            return ValidationRuleLength(min: minLength, max: Int.max, lengthType: .characters, error: error)
        case .maxLenght(let maxLenght):
            return ValidationRuleLength(min: Int.min, max: maxLenght, lengthType: .characters, error: error)
        case .length(let min, let max):
            return ValidationRuleLength(min: min, max: max, lengthType: .characters, error: error)
        case .pattern(let pattern):
            return ValidationRulePattern(pattern: pattern, error: error)
        case .email:
            return ValidationRulePattern(pattern: ValidationPattern.email.pattern, error: error)
        case .equal(let control):
            return ValidationRuleEqual(control: control, error: error)
        }
    }
    
    public static func validate<T>(value: T?, rule: ValidationRule) -> ValidationResult {
        
        return validate(value: value, rules: [rule])
    }
    
    public static func validate<T>(value: T?, rules: [ValidationRule]) -> ValidationResult {
        
        let errors = rules.filter { !$0.validate(value: value) }.map { $0.error }
        return errors.isEmpty ? .valid : .invalid(errors: errors)
    }
}
