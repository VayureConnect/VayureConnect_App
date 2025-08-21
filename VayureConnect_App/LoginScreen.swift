import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var email = ""
    @State private var password = ""
    @State private var showingRegistration = false

    var body: some View {
        NavigationView {
            VStack {
                
               
                Image("Image 1") // Top image
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Text("VAYURE CONNECT")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .font(.custom("Bantayog-Regular", size: 58))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                    .offset(x:0, y:-90)

                
                
//                Text("Login")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding(.bottom, 40)

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 20)

                Button(action: {
                    if authManager.login(email: email, password: password) {
                        // Handled by ContentView's @EnvironmentObject
                    } else {
                        // Show alert or error message
                        print("Login failed")
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
                .padding(.bottom, 10)

                Button(action: {
                    showingRegistration = true
                }) {
                    Text("Sign up")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $showingRegistration) {
                    RegistrationScreen(showingRegistration: $showingRegistration)
                }
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.vayureBlue.ignoresSafeArea())

        }
        
    }
    
}


struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
