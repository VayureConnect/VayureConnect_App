// Simulate connecting to device for 5 seconds then go back to the main dashboard

import SwiftUI

struct ConnectingPage: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var countdown = 5

    var body: some View {
        VStack {
            Text("Connecting...")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Press to Return")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(.top, 40.0)
            }
        }
  
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.vayureBlue.ignoresSafeArea())
        .onAppear {
                  startCountdown()
              }
    }

// Countdown Logic
    private func startCountdown() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if countdown > 1 {
                countdown -= 1
            } else {
                timer.invalidate()
                presentationMode.wrappedValue.dismiss() // Auto return
            }
        }
    }
}

struct ConnectingPage_Previews: PreviewProvider {
    static var previews: some View {
        ConnectingPage()
    }
}
