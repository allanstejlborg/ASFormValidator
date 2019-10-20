import UIKit

public protocol ErrorPresentableControl where Self: UIControl {
    func present(validationResult: ValidationResult)
}
