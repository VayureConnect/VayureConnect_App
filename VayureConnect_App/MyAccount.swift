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
                    Text("Vayure Connect - Privacy Summary. Welcome to Vayure Connect by Vayure - Breathe Easier. We value your privacy. Here's how we handle your information: Location Data - used to show real-time air quality in your area. Air Data - collected from your device (if available) and trusted sources. Your Privacy - we do not sell your data. Shared only with trusted services or if required by law. Your Choices - disable location anytime; request or delete your data via privacy@vayure.com.au. By tapping Accept, you agree to our Privacy Policy.")
                        .padding()
                }
                .frame(height: 200)
                .border(Color.gray, width: 1)
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
            .background(Color.blue.opacity(0.2).ignoresSafeArea())
        }
    }
}

struct MyAccount_Previews: PreviewProvider {
    static var previews: some View {
        MyAccount()
    }
}
