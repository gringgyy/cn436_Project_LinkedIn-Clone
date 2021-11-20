//
//  NetworkCell.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 13/11/2564 BE.
//

import SwiftUI
import Kingfisher

struct NetworkCell: View {
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    
    var didRequest: Bool {
        viewModel.user.didRequest ?? false
    }
    var didConnect: Bool {
        viewModel.user.didConnect ?? false
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(.quaternary, lineWidth: 2)
            .frame(width:(UIScreen.main.bounds.width / 2)-20, height: (UIScreen.main.bounds.width / 2)+40)
            .scaledToFill()
            .background(.white)
            //.padding(.horizontal, 5)
            //.padding(.vertical, 5)
            .overlay(
                VStack {
                    Group {
                        if let imageURL = user.profileImageURL {
                            KFImage(URL(string: imageURL))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipped()
                                .clipShape(Circle())
                                .padding(.top, 20)
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipped()
                                .clipShape(Circle())
                                .padding(.top, 20)
                        }
                        Text(user.fullname)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                        Text("Status")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    if !viewModel.user.isCurrentUser {
                        Button {
                            didRequest ? viewModel.cancelRequest() : viewModel.request()
                            viewModel.connection()
                        } label: {
                            Text(didRequest ? (didConnect ? "Connected" : "Requested") : "Connect")
                                .font(.system(size: 16, weight: .semibold))
                                .frame(width: 172, height: 35)
                                .foregroundColor(didRequest ? Color.gray : Color.blue)
                                .background(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke((didRequest ? Color.gray : Color.blue), lineWidth: 2)
                                )
                        }
                        .cornerRadius(30)
                        .padding(.bottom, 20)
                    }
                }
            )
    }
}
