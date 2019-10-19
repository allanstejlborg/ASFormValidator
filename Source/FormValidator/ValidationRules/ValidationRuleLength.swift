import Foundation

public struct ValidationRuleLength: ValidationRule {
    
    public enum LengthType {
        case characters
        case utf8
        case utf16
        case unicodeScalars
    }
    
    private let min: Int
    private let max: Int
    private let lengthType: LengthType
    public let error: ValidationError
    
    public init(min: Int = 0, max: Int = Int.max, lengthType: LengthType = .characters, error: ValidationError) {
        self.min = min
        self.max = max
        self.lengthType = lengthType
        self.error = error
    }
    
    public func validate<T>(value: T?) -> Bool {
        guard let value = value as? String else {
            return false
        }
        
        let length: Int
        switch lengthType {
        case .characters:
            length = value.count
        case .utf8:
            length = value.utf8.count
        case .utf16:
            length = value.utf16.count
        case .unicodeScalars:
            length = value.unicodeScalars.count
        }
        
        return length >= min && length <= max
    }
}
