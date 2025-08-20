import SwiftUI

struct ConnectingPage: View {
    @Environment(\.presentationMode) var presentationMode

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
    }
}

struct ConnectingPage_Previews: PreviewProvider {
    static var previews: some View {
        ConnectingPage()
    }
}
