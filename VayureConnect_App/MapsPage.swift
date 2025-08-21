import SwiftUI
import MapKit
import CoreLocation

// Render: MapViewRepresentable
// By default, Maps in swift only support pins and annotations, not overlays. So to show coloured areas, I need to use a UIViewRepresentable wrapper around MKMapView, as it's the only way I can access MapKit overlays.


struct MapViewRepresentable: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.setRegion(region, animated: false)
        mapView.delegate = context.coordinator
        
        // Create: circles with different air quality
        let greenCircle = MKCircle(center: region.center, radius: 200) // 200m
        mapView.addOverlay(greenCircle)
        
        let redCircle = MKCircle(center: CLLocationCoordinate2D(
            latitude: region.center.latitude + 0.001,
            longitude: region.center.longitude + 0.001),
            radius: 150) // offset 150m radius
        mapView.addOverlay(redCircle)
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewRepresentable
        init(_ parent: MapViewRepresentable) {
            self.parent = parent
        }
        
        // Render overlays with different colors
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let circle = overlay as? MKCircle {
                let renderer = MKCircleRenderer(circle: circle)
                
                // Red colour based on radius or position but there needs to be a better way to do this in the future
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
            return MKOverlayRenderer()
        }
    }
}

// Render: - MapsPage
// To do: I need to get the GPS values from the phone and use the values to render the current location of the user
struct MapsPage: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -37.667783, longitude: 145.158787),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                Color.vayureBlue.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    // Top Banner
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
                    
                    // Map inside card
                    VStack {
                        MapViewRepresentable(region: $region)
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
                
                // Bottom green bar with tree
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
                        .offset(y: 40)

                    }}
                
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
                            .offset(x:102, y: -80)

                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}
                
                // Bottom bar with return button
//                .safeAreaInset(edge: .bottom) {
//                    ZStack {
//                        Rectangle()
//                            .fill(Color(red: 0.76, green: 0.96, blue: 0.61))
//                            .frame(height: 160)
//                        
//                        Button(action: {
//                            presentationMode.wrappedValue.dismiss()
//                        }) {
//                            Text("Press to return")
//                                .font(.headline)
//                                .foregroundColor(.black)
//                                .frame(width: 320, height: 60)
//                                .background(Color.gray.opacity(0.4))
//                                .cornerRadius(15)
//                        }
//                    }
//                }
                
                // Tree overlay
//                VStack {
//                    Spacer()
//                    HStack {
//                        Spacer()
//                        Image("tree")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 180)
//                            .padding(.trailing, 24)
//                            .offset(y: -60)
//                    }
//                }
//            }
//            
//            // Bottom green bar with account/settings
//            .scrollContentBackground(.hidden)
//            .safeAreaInset(edge: .bottom) {
//                
//                VStack {
//                    Spacer()
//                    ZStack {
//                        Rectangle()
//                            
//                            .fill(Color(red: 0.76, green: 0.96, blue: 0.61))
//                            .frame(height: 150)
//                        
//                        HStack(){
//                            
//                            // Connect button
//                            NavigationLink(destination: ConnectingPage()) {
//                                Text("Press to connect to your device")
//                                    .font(.headline)
//                                    .foregroundColor(.black)
//                                    .frame(width: 380, height: 80)
//                                    .background(Color.gray.opacity(0.4))
//                                    .cornerRadius(15)
//                                   
//
//                            }
//                            .offset(y: -14)
//                        }
//                        
////                        HStack(spacing: 16) {
////                            NavigationLink(destination: MyAccount()) {
////                                Text("My Account")
////                                    .font(.headline)
////                                    .foregroundColor(.black)
////                                    .frame(maxWidth: .infinity, minHeight: 80)
////                                    .background(Color.gray.opacity(0.4))
////                                    .cornerRadius(15)
////                            }
////                            NavigationLink(destination: SettingsPage()) {
////                                Text("Settings")
////                                    .font(.headline)
////                                    .foregroundColor(.black)
////                                    .frame(maxWidth: .infinity, minHeight: 80)
////                                    .background(Color.gray.opacity(0.4))
////                                    .cornerRadius(15)
////                            }
////                        }
////                        .padding(.top, 20.0)
////                        .padding(.bottom, 40.0)
////                        .frame(width: 380.0)
//
//                    }
//                    //.offset(y: 40)
//
//                }}
//            
//        }
//            .navigationBarHidden(true)
//        }
//    }
////}

// Render: - Preview
struct MapsPage_Previews: PreviewProvider {
    static var previews: some View {
        MapsPage()
    }
}



//// Version 1 - working but wont show colour overlays
//import SwiftUI
//import MapKit
//import CoreLocation
//
//struct MapsPage: View {
//    @Environment(\.presentationMode) var presentationMode
//   @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -37.667783, longitude: 145.158787), span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                // Background
//                Color.vayureBlue.ignoresSafeArea()
//                
//                VStack(spacing: 20) {
//                    
//                    // Top Banner
//                    ZStack {
//                        Image("Image 1")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(height: 150)
//                        
//                        Text("MAP")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .foregroundColor(.black)
//                            .offset(y: 10)
//                    }
//                    
//
//                    
//                    // Air Quality Metrics Card
//                    VStack(spacing: 20 ) {
//                        HStack {
//                            Spacer()
//                            VStack {
//                                Map(coordinateRegion: $region)
//                                .frame(height: 360)
//                                .cornerRadius(15.0)
////                                .padding(.horizontal)
//                                
//                                
//                                // To do overlay with colour coded regions (Placeholder)
//                                Text("Color-coded regions for air quality: Green/Yellow/Red")
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                                .padding(.top, 10)
//
//                                Spacer()
//                            
//                                }
//                        }
//                    }
//                    .frame(height: 400)
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(20)
//                    .shadow(radius: 5)
//                    .padding(.horizontal)
//            
//                    Spacer()
//                }
//                
//                // Bottom green bar with account/settings
//                .scrollContentBackground(.hidden)
//                .safeAreaInset(edge: .bottom) {
//                    
//                    VStack {
//                        Spacer()
//                        ZStack {
//                            Rectangle()
//                                
//                                .fill(Color(red: 0.76, green: 0.96, blue: 0.61))
//                                .frame(height: 150)
//                            
//                            HStack(){
//                                // Connect button
//                                
//                                
//                                Button(action: {
//                                    presentationMode.wrappedValue.dismiss()
//                                }) {
//                                    Text("Press to return")
//                                        .font(.headline)
//                                        .foregroundColor(.black)
//                                        .frame(width: 380, height: 80)
//                                        .background(Color.gray.opacity(0.4))
//                                        .cornerRadius(15)
//                                       
//
//                                }
//                                .offset(y: -12)
//                            }
//                            
//
//                        }
//                        .offset(y: 40)
//
//                    }}
//                
//                // Tree overlay
//                VStack {
//                    Spacer()
//                    HStack {
//                        Spacer()
//                        Image("tree")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 220)
//                            .padding(.trailing, 24)
//                            .offset(x:102, y: -80)
//
//                    }
//                }
//            }
//            .navigationBarHidden(true)
//        }
//    }
//}
//
//struct MapsPage_Previews: PreviewProvider {
//    static var previews: some View {
//        MapsPage()
//    }
//}
