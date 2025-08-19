import SwiftUI

struct RegistrationScreen: View {
    @Binding var showingRegistration: Bool
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 40)

                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 20)

                Button(action: {
                    if password != confirmPassword {
                        alertMessage = "Passwords do not match."
                        showingAlert = true
                    } else if UserManager.shared.registerUser(name: name, email: email, password: password) {
                        alertMessage = "Registration successful! You can now log in."
                        showingAlert = true
                    } else {
                        alertMessage = "Registration failed. Email might already be in use."
                        showingAlert = true
                    }
                }) {
                    Text("Create Account")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                }

                NavigationLink(destination: LoginScreen()) {
                    Text("Back")
                        .font(.headline)
                        .foregroundColor(.blue)
//                        .padding()
//                        .frame(width: 250, height: 50)
//                        .background(Color.gray)
//                        .cornerRadius(15.0)
                }
                .padding(.bottom, 10)
                .padding(.top, 20.0)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Registration Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")) {
                        if alertMessage == "Registration successful! You can now log in." {
                            showingRegistration = false
                        }
                    })
                }
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.2).ignoresSafeArea())
        }
    }
}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen(showingRegistration: .constant(true))
    }
}
