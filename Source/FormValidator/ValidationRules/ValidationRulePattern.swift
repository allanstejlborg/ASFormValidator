import Foundation

struct ValidationRulePattern: ValidationRule {
    
    let pattern: String
    let error: ValidationError
    
    public init(pattern: String, error: ValidationError) {
        self.pattern = pattern
        self.error = error
    }
    
    func validate<T>(value: T?) -> Bool {
        guard let value = value as? String else {
            return false
        }
        
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: value)
    }
}
