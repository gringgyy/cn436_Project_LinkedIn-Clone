//
//  UserListView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 15/11/2564 BE.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        searchText.isEmpty ? viewModel.users : viewModel.filterUsers(withText: searchText)
    }
    
    var layout = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, content : {
                ForEach(users) { user in
                    NavigationLink(destination: ProfileView(user: user)) {
                        NetworkCell(user: user, viewModel: ProfileViewModel(user: user))
                    }
                }
            })
        }
    }
}

