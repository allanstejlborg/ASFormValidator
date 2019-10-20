import Foundation

public struct ValidationRuleNumeric: ValidationRule {
    
    private let min: Int?
    private let max: Int?
    public let error: ValidationError
    
    public init(min: Int?, max: Int?, error: ValidationError) {
        self.min = min
        self.max = max
        self.error = error
    }
    
    public func validate<T>(value: T?) -> Bool {
        guard let value = value as? String else {
            return false
        }
        
        var integer: Int = 0
        let scanner = Scanner(string: value)
        guard scanner.scanInt(&integer) else {
            return false
        }

        if let min = min, integer < min {
            return false
        }
        
        if let max = max, integer > max {
            return false
        }
        
        return true
    }
}
