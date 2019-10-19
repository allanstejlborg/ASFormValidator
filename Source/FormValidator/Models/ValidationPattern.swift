import Foundation

public enum ValidationPattern {
    case email
    
    var pattern: String {
        switch self {
        case .email:
            return "^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,})$"
        }
    }
}
