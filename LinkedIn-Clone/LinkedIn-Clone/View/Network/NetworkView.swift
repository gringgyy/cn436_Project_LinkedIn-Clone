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
    
    //let items = Array(1...3).map({"Element \($0)"})
    
    //var layout = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            UserListView(viewModel: viewModel, searchText: $searchText)
        }
    }
}

