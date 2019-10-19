import Foundation

protocol ValidationRule {
    var error: ValidationError { get }
    func validate<T>(value: T?) -> Bool
}
