//
//  HomeView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.posts) { post in
                    HomeCell(viewModel: HomeCellViewModel(post: post))
                }
            }
        }
        .background(.quaternary)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
