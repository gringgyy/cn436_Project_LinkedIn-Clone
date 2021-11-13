//
//  ContentView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI
    
struct ContentView: View {
    @State var selectedIndex = 0
    @State var menuOpened = false
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UINavigationBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        MainView(selectedIndex: $selectedIndex)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
