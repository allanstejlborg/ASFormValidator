import UIKit

public protocol ErrorPresentableElement where Self: NSObject {
    func present(validationResult: ValidationResult)
}
