import Foundation

public struct ValidationRuleBoolean: ValidationRule {
    
    private let state: Bool
    public let error: ValidationError
    
    public init(state: Bool, error: ValidationError) {
        self.state = state
        self.error = error
    }
    
    public func validate<T>(value: T?) -> Bool {
        guard let value = value as? Bool else {
            return false
        }
        
        return value == state
    }
}
