//
//  HomeView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                HomeCell()
                    .padding(.bottom, 10)
                HomeCell()
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
