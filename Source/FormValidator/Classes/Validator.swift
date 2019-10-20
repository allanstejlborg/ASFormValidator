import Foundation

public class Validator {
    
    public static func validationRule(for type: ValidationType, error: ValidationError) -> ValidationRule {
        
        switch type {
        case .required:
            return ValidationRuleRequired(error: error)
        case .minLength(let minLength):
            return ValidationRuleLength(min: minLength, max: nil, lengthType: .characters, error: error)
        case .maxLength(let maxLength):
            return ValidationRuleLength(min: nil, max: maxLength, lengthType: .characters, error: error)
        case .length(let minLength, let maxLength):
            return ValidationRuleLength(min: minLength, max: maxLength, lengthType: .characters, error: error)
        case .numeric:
            return ValidationRuleNumeric(min: nil, max: nil, error: error)
        case .numericMin(let min):
            return ValidationRuleNumeric(min: min, max: nil, error: error)
        case .numericMax(let max):
            return ValidationRuleNumeric(min: nil, max: max, error: error)
        case .numericRange(let min, let max):
            return ValidationRuleNumeric(min: min, max: max, error: error)
        case .decimal:
            return ValidationRuleDecimal(min: nil, max: nil, error: error)
        case .decimalMin(let min):
            return ValidationRuleDecimal(min: min, max: nil, error: error)
        case .decimalMax(let max):
            return ValidationRuleDecimal(min: nil, max: max, error: error)
        case .decimalRange(let min, let max):
            return ValidationRuleDecimal(min: min, max: max, error: error)
        case .pattern(let pattern):
            return ValidationRulePattern(pattern: pattern, error: error)
        case .email:
            return ValidationRulePattern(pattern: ValidationPattern.email.pattern, error: error)
        case .equal(let control):
            return ValidationRuleEqual(control: control, error: error)
        case .boolean(let state):
            return ValidationRuleBoolean(state: state, error: error)
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
