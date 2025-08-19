import SwiftUI

struct ConnectingPage: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Connecting...")
                .font(.largeTitle)
                .fontWeight(.bold)
//            NavigationLink(destination: MainDashboard()) {
//                Text("Back")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .contentMargins(.top, 40.0)
//                        .frame(width: 250, height: 50)
//                        .background(Color.gray)
//                        .cornerRadius(15.0)
//            }
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Press to Return")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
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
