import SwiftUI
import MapKit
import CoreLocation

struct MapsPage: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -37.667783, longitude: 145.158787), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    var body: some View {
        NavigationView {
            VStack {
                Text("Air Quality Map")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)

                Map(coordinateRegion: $region)
                    .frame(height: 400)
                    .cornerRadius(15.0)
                    .padding(.horizontal)

                // Overlay with color-coded regions (Placeholder)
                Text("Color-coded regions for air quality: Green/Yellow/Red")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 10)

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
            .background(Color.vayureBlue.ignoresSafeArea())
        }
    }
}

struct MapsPage_Previews: PreviewProvider {
    static var previews: some View {
        MapsPage()
    }
}
