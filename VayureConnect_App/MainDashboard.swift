import SwiftUI

struct MainDashboard: View {
    
    var body: some View {
        
        
        TabView {
            
            NavigationView {
                
                VStack {
                    Image("Image 1")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                    
                    Text("VAYURE CONNECT")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .font(.custom("Bantayog-Regular", size: 58))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                        .offset(x:0, y:-90)

                    //Spacer()

                    // Air Quality Metrics
                    Group {
                        Text("Air Quality: Good")
                        Text("Battery: 85%")
                        Text("CO₂: 400 ppm")
                        Text("Pressure: 1012 hPa")
                        Text("Last Data Collection: Just now")
                    }

                    .font(.title2)
                    .padding(.bottom, 10)

                    Spacer()

                    NavigationLink(destination: MapsPage()) {
                        Text("Press to view map")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 250, height: 50)
                            .background(Color.blue)
                            .cornerRadius(15.0)
                    }
                    .padding(.bottom, 10)

                    NavigationLink(destination: ConnectingPage()) {
                        Text("Press to connect to your device")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 250, height: 50)
                            .background(Color.green)
                            .cornerRadius(15.0)
                    }

                    Spacer()
                }
                .navigationBarHidden(true)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.vayureBlue.ignoresSafeArea())
            }
            .tabItem {
                Label("Dashboard", systemImage: "house.fill")
            }

            MyAccount()
                .tabItem {
                    Label("My Account", systemImage: "person.fill")
                }

            SettingsPage()
                .tabItem {
                    Label("Settings", systemImage: "gear.fill")
                }
        }
    }
}

struct MainDashboard_Previews: PreviewProvider {
    static var previews: some View {
        MainDashboard()
    }
}
