import SwiftUI

struct RegistrationScreen: View {
    @Binding var showingRegistration: Bool
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var allowLocation = true
    @Environment(\.presentationMode) var presentationMode


    
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                Color.vayureBlue.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    // Vayure Connect logo
                    ZStack {
                        Image("Image 1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                        
                        Text("SIGN UP")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .offset(y: 10)
                    }
                    

                    
                    // Air Quality Metrics Card
                    VStack(spacing: 20 ) {
                        HStack {
                            Spacer()
                            VStack {

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
                                  
                                                .alert(isPresented: $showingAlert) {
                                                    Alert(title: Text("Registration Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")) {
                                                        if alertMessage == "Registration successful! You can now log in." {
                                                            showingRegistration = false
                                                        }
                                                    })
                                                }
                                            
                            
                                            Spacer()
                            
                                        }
                        }
                    }
                    .frame(width:380, height: 380 )
                    .padding(.top, 40.0)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)

            
                    Spacer()
                }
                
                // Bottom green bar with account/settings
                .scrollContentBackground(.hidden)
                .safeAreaInset(edge: .bottom) {
                    
                    VStack {
                        Spacer()
                        ZStack {
                            Rectangle()
                                
                                .fill(Color(red: 0.76, green: 0.96, blue: 0.61))
                                .frame(height: 150)
                            
                            HStack(){
                                // Connect button
                                
                                
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Text("Press to return")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .frame(width: 380, height: 80)
                                        .background(Color.gray.opacity(0.4))
                                        .cornerRadius(15)
                                       

                                }
                                .offset(y: -12)
                            }
                            

                        }
                        .offset(y: 40)

                    }}
                
                // Tree overlay
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image("tree")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 220)
                            .padding(.trailing, 24)
                            .offset(x:102, y: -80)

                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen(showingRegistration: .constant(true))
    }
}
