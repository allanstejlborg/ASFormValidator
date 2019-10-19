import Foundation

public struct ValidationRuleRequired: ValidationRule {
    
    public let error: ValidationError
    
    public init(error: ValidationError) {
        self.error = error
    }
    
    public func validate<T>(value: T?) -> Bool {
        guard let value = value as? String else {
            return false
        }
        
        return !value.isEmpty
    }
}
