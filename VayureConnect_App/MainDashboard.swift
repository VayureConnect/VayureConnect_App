import SwiftUI

struct MainDashboard: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                Color.vayureBlue.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    // Vayure Connect logo
                    ZStack {
                        Image("Image 1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                        
                        Text("VAYURE CONNECT")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .offset(y: 10)
                    }
                    
                    // Press to view map button
                    NavigationLink(destination: MapsPage()) {
                        Text("Press to view map")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(width: 380, height: 80)
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(15)
                            .padding(.bottom, 0.0)

                    }
                    
                    // Air Quality Metrics Card
                    VStack(spacing: 20 ) {
                        HStack {
                            Spacer()
                            VStack {
                                Image("co2_Battery_icon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 40)
                                    .font(.largeTitle)
                                Text("100%")
                                    .font( .subheadline)
                            }
                            Spacer()
                            VStack {
                                Image("co2_Cloud_icon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 50)
                                    .font(.largeTitle)
                                Text("30 inHg")
                                Text("1015.9 hPa")
                                    .font(.caption)
                            }
                            Spacer()
                            VStack {
                                Image("co2_Connect_icon") // placeholder, replace with CO icon
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 50)
                                    .font(.largeTitle)
                                    
                                Text("100 ppm")
                                    .font( .subheadline)

                            }
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            VStack {
                                Image("co2_icon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 50)
                                    .font(.largeTitle)
                                Text("400 ppm")
                                    .font(.caption)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Last data collection:")
                                    .font(.footnote)
                                Text("15 minutes ago")
                                    .font(.subheadline)
                            }
                            Spacer()
                        }
                    }
                    .frame(height: 180)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding(.horizontal)
            
                    Spacer()
                }
                
                // Bottom green bar with account/settings
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
                                NavigationLink(destination: ConnectingPage()) {
                                    Text("Press to connect to your device")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .frame(width: 380, height: 80)
                                        .background(Color.gray.opacity(0.4))
                                        .cornerRadius(15)
                                       

                                }
                                .offset(y: -140)
                            }
                            
                            HStack(spacing: 16) {
                                NavigationLink(destination: MyAccount()) {
                                    Text("My Account")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, minHeight: 80)
                                        .background(Color.gray.opacity(0.4))
                                        .cornerRadius(15)
                                }
                                NavigationLink(destination: SettingsPage()) {
                                    Text("Settings")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, minHeight: 80)
                                        .background(Color.gray.opacity(0.4))
                                        .cornerRadius(15)
                                }
                            }
                            .padding(.top, 20.0)
                            .padding(.bottom, 40.0)
                            .frame(width: 380.0)

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

struct MainDashboard_Previews: PreviewProvider {
    static var previews: some View {
        MainDashboard()
    }
}
