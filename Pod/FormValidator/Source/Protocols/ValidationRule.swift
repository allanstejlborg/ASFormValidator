import Foundation

public protocol ValidationRule {
    var error: ValidationError { get }
    func validate<T>(value: T?) -> Bool
}
