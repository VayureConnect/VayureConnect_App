import Foundation
import SwiftUI

class AuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false

    func login(email: String, password: String) -> Bool {
        if UserManager.shared.authenticateUser(email: email, password: password) {
            isAuthenticated = true
            return true
        }
        isAuthenticated = false
        return false
    }

    func logout() {
        isAuthenticated = false
    }
}
