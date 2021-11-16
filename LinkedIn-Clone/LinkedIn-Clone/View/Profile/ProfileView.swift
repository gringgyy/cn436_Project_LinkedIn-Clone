//
//  ProfileView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State var user: User
    
    var body: some View {
        ScrollView {
            ProfileHeaderView(viewModel: ProfileViewModel(user: user))
            if let currentProfileID = user.id {
                BackgroundView()
            }
        }
    }
}
