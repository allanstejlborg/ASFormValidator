import Foundation

public enum ValidationType {
    case required
    case minLength(_ minLength: Int)
    case maxLength(_ maxLength: Int)
    case length(min: Int, max: Int)
    case numeric
    case numericMin(_ min: Int)
    case numericMax(_ max: Int)
    case numericRange(_ min: Int, _ max: Int)
    case decimal
    case decimalMin(_ min: Decimal)
    case decimalMax(_ max: Decimal)
    case decimalRange(_ min: Decimal, _ max: Decimal)
    case pattern(_ pattern: String)
    case email
    case equal(_ control: ValidatableControl)
    case boolean(_ state: Bool)
}
