//
//  NotificationCell.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 14/11/2564 BE.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    //let user: User
    @ObservedObject var viewModel: NotificationsCellViewModel
    
    var didRequest: Bool {
        viewModel.notification.didRequest ?? false
    }
    var didConnect: Bool {
        viewModel.notification.didConnect ?? false
    }
    
    var body: some View {
        HStack {
            if let user = viewModel.notification.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    if let imageURL = viewModel.notification.profileImageURL {
                        KFImage(URL(string: imageURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 65, height: 65)
                            .clipped()
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 65, height: 65)
                            .clipped()
                            .clipShape(Circle())
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(viewModel.notification.fullname)
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(.black)
                            Text(viewModel.notification.type.notificationMessage)
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.black)
                                
                        }
                        if let post = viewModel.notification.post {
                            NavigationLink(destination: HomeCell(viewModel: HomeCellViewModel(post: post))) {
                                KFImage(URL(string: post.imageURL))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipped()
                            }
                        }
                    }
                }
            }
        }
    }
}
