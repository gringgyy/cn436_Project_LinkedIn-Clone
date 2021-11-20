//
//  ProfileView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    //@ObservedObject var viewModel: BackgroundViewModel
    @State var user: User
    //@State var background: Background
    
    var body: some View {
        ScrollView {
            ProfileHeaderView(viewModel: ProfileViewModel(user: user))
        }
    }
}
