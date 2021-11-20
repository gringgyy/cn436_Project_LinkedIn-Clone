//
//  ContentView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI
    
struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UINavigationBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                SignInView()
            } else {
                if let user = viewModel.currentUser {
                    //MainView(selectedIndex: $selectedIndex)
                    MainView(user: user, selectedIndex: $selectedIndex)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
