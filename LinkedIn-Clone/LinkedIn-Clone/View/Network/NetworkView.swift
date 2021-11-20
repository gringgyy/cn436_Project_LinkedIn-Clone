//
//  NetworkView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI

struct NetworkView: View {
    @ObservedObject var viewModel = SearchViewModel()
    
    @State var searchText = ""
    @State var inSearchMode = false

    var body: some View {
        ScrollView {
        VStack {
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            UserListView(viewModel: viewModel, searchText: $searchText)
        }
        .background(.white)
        }
    }
}

