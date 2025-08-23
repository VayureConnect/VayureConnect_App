import SwiftUI

struct MyAccount: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = "Liam H"
       @State private var email: String = "test@test.com"
       @State private var warranty: String = "2025-12-31"
       
    
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
                        
                        Text("MY ACCOUNT")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .offset(y: 10)
                    }
                    

                    
                    // Card
                    VStack() {
                        HStack {
                            //Spacer()
                            VStack {
                            // Account Info
                                Form {
                                            Section() {
                                                HStack {
                                                    Text("Name:")
                                                    TextField("Enter name", text: $name)
                                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                                }
                                                
                                                
                                                HStack {
                                                    Text("Email:")
                                                    TextField("Enter email", text: $email)
                                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                                        .keyboardType(.emailAddress)
                                                }
                                                
                                                HStack {
                                                    Text("Warranty:")
                                                    TextField("Expiry Date", text: $warranty)
                                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                                }
                                                
                                            }
                                    
                                }
                                .padding(0.0)
                                .font(.body)
                                .offset(y:-30)
                                .zIndex(99999)
                                
                                                //Divider()
                                                    .padding(.horizontal)
                                
                                              
                                
                                                ScrollView {
                                                    Text("Privacy Policy")
                                                        .font(.headline)
                                                        .padding(.bottom, 20)
                                                    Text("Vayure Connect - Privacy Summary.")
                                                    Text(" ")
                                                    Text("Welcome to Vayure Connect by Vayure - Breathe Easier.")
                                                    Text(" ")
                                
                                                    Text("We value your privacy. Here's how we handle your information: Location Data - used to show real-time air quality in your area.")
                                                    Text("Air Data - collected from your device (if available) and trusted sources.")
                                                    Text("Your Privacy - we do not sell your data. Shared only with trusted services or if required by law.")
                                                    Text("Your Choices - disable location anytime; request or delete your data via privacy@vayure.com.au.")
                                                    Text("By tapping Accept, you agree to our Privacy Policy.")
                                                    Text(" ")
                                
                                                        .padding()
                                                }
                                                .frame(height: 180)
                                                .border(Color.gray, width: 0)
//                                                .padding(.horizontal)
//                                                .padding(.bottom, 20)
                                                .padding(20)

                                                .background(Color.vayureBlue)
                                                .cornerRadius(15.0)

                                
                                
                                                Button(action: {
                                                    // Get Support action
                                                }) {
                                                    Text("Get Support")
                                                        .font(.headline)
                                                        .foregroundColor(.white)
                                                        .padding()
                                                        .frame(width: 200, height: 50)
                                                        .background(Color.orange)
                                                        .cornerRadius(15.0)
                                                }
                                                .padding(.bottom, 10)
                                                .padding(.top, 10)
                            
                                        }
                        }
                    }
                    .frame(height: 460)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding(.horizontal)
            
                    //Spacer()
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
                        .offset(y: 20)

                    }}
                
            }
            .navigationBarHidden(true)
        }
    }
}


struct MyAccount_Previews: PreviewProvider {
    static var previews: some View {
        MyAccount()
    }
}
