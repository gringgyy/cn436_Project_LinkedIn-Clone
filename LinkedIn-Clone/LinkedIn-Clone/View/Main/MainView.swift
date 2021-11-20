//
//  MainView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI

struct MainView: View {
    @State var user: User
    @Binding var selectedIndex: Int
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                HomeView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0)
                
                NetworkView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "person.2.fill")
                        Text("My Network")
                    }
                    .tag(1)
                
                PostView()
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.app.fill")
                        Text("Post")
                    }
                    .tag(2)
                
                NotificationView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "bell.fill")
                        Text("Notifications")
                    }
                    .tag(3)
                
                JobView()
                    .onTapGesture {
                        selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "briefcase.fill")
                        Text("Jobs")
                    }
                    .tag(4)
                
            }
            .navigationTitle(tabTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: profileButton, trailing: logOutButton)
            .accentColor(.gray)
        }
    }
    
    var profileButton: some View {
        NavigationLink(destination: ProfileView(user: user)) {
            Image(systemName: "person.crop.circle.fill")
                .foregroundColor(.gray)
        }
    }
    
    var logOutButton: some View {
        Button {
            AuthViewModel.shared.signOut()
        } label: {
            Image(systemName: "rectangle.portrait.and.arrow.right")
                .foregroundColor(.red)
        }
    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Home"
        case 1: return "My Network"
        case 2: return "Post"
        case 3: return "Notification"
        case 4: return "Jobs"
        default: return ""
        }
    }
}


