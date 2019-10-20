import Foundation

public struct ValidationRuleDecimal: ValidationRule {
    
    private let min: Decimal?
    private let max: Decimal?
    public let error: ValidationError
    
    public init(min: Decimal?, max: Decimal?, error: ValidationError) {
        self.min = min
        self.max = max
        self.error = error
    }
    
    public func validate<T>(value: T?) -> Bool {
        guard let value = value as? String else {
            return false
        }
        
        var decimal: Decimal = 0
        let scanner = Scanner(string: value)
        guard scanner.scanDecimal(&decimal) else {
            return false
        }
        
        if let min = min, decimal < min {
            return false
        }

        if let max = max, decimal > max {
            return false
        }

        return true
    }
}
