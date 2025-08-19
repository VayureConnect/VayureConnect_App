import SwiftUI

struct ConnectingPage: View {
    var body: some View {
        VStack {
            Text("Connecting...")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.opacity(0.2).ignoresSafeArea())
    }
}

struct ConnectingPage_Previews: PreviewProvider {
    static var previews: some View {
        ConnectingPage()
    }
}
