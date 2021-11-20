//
//  ProfileButtonView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 16/11/2564 BE.
//

import SwiftUI

struct ProfileButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    @State var addBackgroundPresented = false
    @State var editProfileShow = false
    
    var didRequest: Bool {
        viewModel.user.didRequest ?? false
    }
    var didConnect: Bool {
        viewModel.user.didConnect ?? false
    }
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            HStack {
                Button {
                    editProfileShow.toggle()
                } label: {
                    Text("Edit Profile")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width / 1.15, height: 35)
                        .foregroundColor(Color.blue)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                }.sheet(isPresented: $editProfileShow) {
                    EditProfileView(user: $viewModel.user)
                }
                .padding(.top, 10)
                
                
            }
        } else {
            HStack {
                Button {
                    didRequest ? viewModel.cancelRequest() : viewModel.request()
                    viewModel.connection()
                } label: {
                    Text(didRequest ? (didConnect ? "Connected" : "Requested") : "Connect")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 175, height: 35)
                        .foregroundColor(didRequest ? Color.gray : Color.blue)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke((didRequest ? Color.gray : Color.blue), lineWidth: 1.5)
                        )
                }
                .padding(.top, 10)
                Spacer()
                
                if let user = viewModel.user {
                    NavigationLink(destination: ChatView(user: user)) {
                        Text("Message")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 175, height: 35)
                            .foregroundColor(Color.blue)
                            .background(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.blue, lineWidth: 1.5)
                            )
                    }
                }
            }
        }
    }
}
