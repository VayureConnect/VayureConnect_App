import SwiftUI

struct SettingsPage: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var allowLocation = true
    @State private var allowNotifications = true

    var body: some View {
        NavigationView {
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 40)

                Toggle(isOn: $allowLocation) {
                    Text("Allow Location")
                        .font(.title2)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)

                Toggle(isOn: $allowNotifications) {
                    Text("Allow Notifications")
                        .font(.title2)
                }
                .padding(.horizontal)
                .padding(.bottom, 40)

                Spacer()

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

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}
