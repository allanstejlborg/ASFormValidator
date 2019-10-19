import Foundation

enum ValidationResult {
    case valid
    case invalid(errors: [ValidationError])
}
