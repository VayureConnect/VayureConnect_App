import SwiftUI

struct SettingsPage: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var allowLocation = true
    @State private var allowNotifications = true

    
    
  
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
                            
                            Text("SETTINGS")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .offset(y: 10)
                        }
                        

                        
                        // Air Quality Metrics Card
                        VStack(spacing: 20 ) {
                            HStack {
                                Spacer()
                                VStack {
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
                                
                                            }
                            }
                        }
                        .frame(width: 380, height: 280)
                        .padding(.top, 40.0)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 5)
     
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


struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}
