import Foundation

public enum ValidationResult {
    case valid
    case invalid(errors: [ValidationError])
}
