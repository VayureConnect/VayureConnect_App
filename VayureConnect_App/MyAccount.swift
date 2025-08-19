import SwiftUI

struct MyAccount: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                Text("My Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)

                // Account Info
                Group {
                    Text("Name: John Doe")
                    Text("Email: john.doe@example.com")
                    Text("Warranty Expiry: 2025-12-31")
                }
                .font(.title2)
                .padding(.bottom, 10)

                Divider()
                    .padding(.horizontal)

                Text("Privacy Policy")
                    .font(.headline)
                    .padding(.top, 20)

                ScrollView {
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
                .frame(height: 200)
                .background(Color.white)
                .border(Color.gray, width: 0)
                .padding(.horizontal)
                .padding(.bottom, 20)


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

                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Press to Return")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.2).ignoresSafeArea())
        }
    }
}

struct MyAccount_Previews: PreviewProvider {
    static var previews: some View {
        MyAccount()
    }
}
