import Foundation

struct User: Codable {
    var name: String
    var email: String
    var passwordHash: String // We'll need to store the password as a hashed and not just text
}

class UserManager {
    static let shared = UserManager()
    private let userDefaultsKey = "registeredUsers"

    private init() {}

    func registerUser(name: String, email: String, password: String) -> Bool {
        // In the real app, lets hash the password before storing it
        let passwordHash = password // use a proper hashing algorithm

        var users = getRegisteredUsers()
        if users.contains(where: { $0.email == email }) {
            return false // if the the email already exists then let the user know the email already exists
        }

        let newUser = User(name: name, email: email, passwordHash: passwordHash)
        users.append(newUser)
        saveRegisteredUsers(users)
        return true
    }

    func getRegisteredUsers() -> [User] {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey) {
            if let decodedUsers = try? JSONDecoder().decode([User].self, from: data) {
                return decodedUsers
            }
        }
        return []
    }

    private func saveRegisteredUsers(_ users: [User]) {
        if let encoded = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }

    func authenticateUser(email: String, password: String) -> Bool {
        let users = getRegisteredUsers()
        // compare hashed password
        return users.contains(where: { $0.email == email && $0.passwordHash == password })
    }
}
