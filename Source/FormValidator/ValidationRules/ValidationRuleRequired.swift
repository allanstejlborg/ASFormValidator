import Foundation

struct ValidationRuleRequired: ValidationRule {
    
    let error: ValidationError
    
    public init(error: ValidationError) {
        self.error = error
    }
    
    func validate<T>(value: T?) -> Bool {
        guard let value = value as? String else {
            return false
        }
        
        return !value.isEmpty
    }
}
