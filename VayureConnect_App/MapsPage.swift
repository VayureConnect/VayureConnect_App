import SwiftUI
import MapKit
import CoreLocation

// MARK: - LocationGrabber (handles GPS updates)
class LocationGrabber: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var hasCenteredOnUser = false

    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -37.567783, longitude: 145.158787),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    // Circles fixed at specific coordinates this would need to call stored data from a .json payload based on the air quality
    @Published var circles: [MKCircle] = [
        MKCircle(center: CLLocationCoordinate2D(latitude: -37.667783, longitude: 145.158787), radius: 200),
        MKCircle(center: CLLocationCoordinate2D(latitude: -37.666783, longitude: 145.159787), radius: 150)
    ]
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        // We show the blue dot, but do NOT change the region automatically
//    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            // Center map only the first time
            if !self.hasCenteredOnUser {
                self.region.center = location.coordinate
                self.hasCenteredOnUser = true
            }
            // Do NOT move the map afterwards (user can pan freely)
        }
    }

}

// MARK: - MapViewRepresentable (UIKit wrapper for MKMapView)
struct MapViewRepresentable: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    var circles: [MKCircle]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.setRegion(region, animated: false)
        
        // Add fixed circles
        circles.forEach { mapView.addOverlay($0) }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Update region if needed (optional)
        uiView.setRegion(region, animated: true)
        
        // Remove old overlays and re-add fixed circles
        uiView.overlays.forEach { uiView.removeOverlay($0) }
        circles.forEach { uiView.addOverlay($0) }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewRepresentable
        init(_ parent: MapViewRepresentable) { self.parent = parent }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            guard let circle = overlay as? MKCircle else { return MKOverlayRenderer() }
            let renderer = MKCircleRenderer(circle: circle)
            if circle.radius == 200 {
                renderer.fillColor = UIColor.green.withAlphaComponent(0.3)
                renderer.strokeColor = UIColor.green
            } else {
                renderer.fillColor = UIColor.red.withAlphaComponent(0.3)
                renderer.strokeColor = UIColor.red
            }
            renderer.lineWidth = 2
            return renderer
        }
    }
}

// MARK: - MapsPage (SwiftUI View)
struct MapsPage: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var locationGrabber = LocationGrabber()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.vayureBlue.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Title & Logo
                    ZStack {
                        Image("Image 1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                        
                        Text("MAP")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .offset(y: 10)
                    }
                    
                    // Map
                    VStack {
                        MapViewRepresentable(region: $locationGrabber.region, circles: locationGrabber.circles)
                            .frame(height: 360)
                            .cornerRadius(15)
                        
                        Text("Colour coded circles show air quality zones")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.top, 10)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                    
                    Spacer()
                }
                
                // Bottom bar
                .safeAreaInset(edge: .bottom) {
                    VStack {
                        Spacer()
                        ZStack {
                            Rectangle()
                                .fill(Color(red: 0.76, green: 0.96, blue: 0.61))
                                .frame(height: 150)
                            
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
                        .offset(y: 40)
                    }
                }
                
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
                            .offset(x: 102, y: -80)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Preview
struct MapsPage_Previews: PreviewProvider {
    static var previews: some View {
        MapsPage()
    }
}
