//
//  MainView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI

struct MenuContent: View {

    var body: some View {
        ZStack {
            Color.white
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "face.smiling.fill")
                    //Image("Anchilee")
                        //.scaledToFill()
                        //.frame(width: 40, height: 40)
                        //.clipped()
                        //.clipShape(Circle())
                    Text("Name Surname")
                        .font(.system(size: 25, weight: .semibold))
                }
                //.padding()
                
                HStack {
                    //Image(systemName: "person.crop.circle.fill")
                        
                    NavigationLink(
                        destination: ProfileView().navigationBarHidden(true),
                        label: {
                            HStack {
                                Text("View Profile")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 20, weight: .semibold))
                            }
                            //.padding()
                        }
                    )
                }
                
                HStack {
                    NavigationLink(
                        destination: ProfileView().navigationBarHidden(true),
                        label: {
                            HStack {
                                Text("Log Out")
                                    .foregroundColor(.red)
                                    .font(.system(size: 20, weight: .semibold))
                            }
                            //.padding()
                        }
                    )
                }
                
                Spacer()
                
            }
            .padding(.top, 55)
        }
    }
}


struct SideMenu: View {
    let width: CGFloat
    let menuOpened: Bool
    let toggleMenu: () -> Void
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.5))
            .opacity(self.menuOpened ? 1 : 0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.toggleMenu()
            }
            HStack {
                MenuContent()
                    .frame(width: width)
                    .offset(x: menuOpened ? 0 : -width)
                    .animation(.default)
                Spacer()
            }
        }
    }
}

struct MainView: View {
    @Binding var selectedIndex: Int
    @State var menuOpened = false
    
    var body: some View {
        ZStack {
            if !menuOpened {
                NavigationView {
                    TabView(selection: $selectedIndex) {
                        HomeView()
                            .onTapGesture {
                                selectedIndex = 0
                            }
                            .tabItem {
                                VStack {
                                    Image(systemName: "house.fill")
                                    Text("Home")
                                }
                            }
                            .tag(0)
                        NetworkView()
                            .onTapGesture {
                                selectedIndex = 1
                            }
                            .tabItem {
                                VStack {
                                    Image(systemName: "person.2.fill")
                                    Text("My Network")
                                }
                            }
                            .tag(1)
                        PostView()
                            .onTapGesture {
                                selectedIndex = 2
                            }
                            .tabItem {
                                VStack {
                                    Image(systemName: "plus.app.fill")
                                    Text("Post")
                                }
                            }
                            .tag(2)
                        NotificationView()
                            .onTapGesture {
                                selectedIndex = 3
                            }
                            .tabItem {
                                VStack {
                                    Image(systemName: "bell.fill")
                                    Text("Notifications")
                                }
                            }
                            .tag(3)
                        JobView()
                            .onTapGesture {
                                selectedIndex = 4
                            }
                            .tabItem {
                                VStack {
                                    Image(systemName: "briefcase.fill")
                                    Text("Jobs")
                                }
                            }
                            .tag(4)
                    }
                    .navigationTitle(tabTitle)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(leading: profileButton, trailing: chatButton)
                    .accentColor(.gray)
                }
            }
            SideMenu(width: UIScreen.main.bounds.width/1.33, menuOpened: menuOpened, toggleMenu: toggleMenu)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func toggleMenu() {
        menuOpened.toggle()
    }
    var profileButton: some View {
        Button {
            //AuthViewModel.shared.signOut()
            self.menuOpened.toggle()
        } label: {
            Image(systemName: "person.crop.circle.fill")
                .foregroundColor(.gray)
        }
    }
    
    var chatButton: some View {
        Button {
            //AuthViewModel.shared.signOut()
        } label: {
            Image(systemName: "ellipsis.bubble.fill")
                .foregroundColor(.gray)
        }
    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Home"
        case 1: return "Network"
        case 2: return "Post"
        case 3: return "Notification"
        case 4: return "Jobs"
        default: return ""
        }
    }
}


