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
                    //didFollow ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text("Edit Profile")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 175, height: 35)
                        .foregroundColor(Color.blue)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                }
                .padding(.top, 10)
                Spacer()
                Button {
                    //didFollow ? viewModel.unfollow() : viewModel.follow()
                    addBackgroundPresented.toggle()
                } label: {
                    Text("Add Background")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 175, height: 35)
                        .foregroundColor(Color.blue)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                }
                .padding(.top, 10)
                .padding(.trailing, 20)
                .sheet(isPresented: $addBackgroundPresented) {
                    AddBackgroundView()
                }
            }
        } else {
            HStack {
                Button {
                    //didFollow ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text(didRequest ? (didConnect ? "Connected" : "Requested") : "Connect")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 175, height: 35)
                        .foregroundColor(didRequest ? Color.gray : Color.blue)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke((didRequest ? Color.gray : Color.blue), lineWidth: 2)
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
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                }
            }
        }
    }
}
