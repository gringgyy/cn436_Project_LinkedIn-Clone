//
//  HomeView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    /*
    var posts: [Post] {
        viewModel.posts
    }
    
    var layout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 1)
    */
    var body: some View {
        ScrollView {
            
            VStack {
                //Text("1")
                ForEach(viewModel.posts) { post in
                    HomeCell(viewModel: HomeCellViewModel(post: post))
                }
                //Text("1")
            }
            .background(.quaternary)
            /*
            LazyVGrid(columns: layout, content : {
                ForEach(posts) { post in
                    //print("\(post)")
                    HomeCell(viewModel: HomeCellViewModel(post: post))
                }
            })
            */
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
