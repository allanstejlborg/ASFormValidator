import UIKit

protocol ErrorPresentableControl where Self: UIControl {
    func present(validationResult: ValidationResult)
}
