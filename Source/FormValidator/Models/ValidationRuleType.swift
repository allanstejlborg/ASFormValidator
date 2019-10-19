import Foundation

enum ValidationRuleType {
    case required
    case minLenght(_ minLenght: Int)
    case maxLenght(_ maxLenght: Int)
    case length(min: Int, max: Int)
    case pattern(_ pattern: String)
    case email
    case equal(_ control: ValidatableControl)
}
