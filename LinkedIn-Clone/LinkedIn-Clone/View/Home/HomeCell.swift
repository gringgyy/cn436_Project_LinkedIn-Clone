//
//  HomeCell.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI
import Kingfisher

struct HomeCell: View {
    //var postImage: String
    @ObservedObject var viewModel: HomeCellViewModel
    
    var didLike: Bool {
        viewModel.post.didLike ?? false
    }
    
    var body: some View {
        VStack (alignment: .leading){
            if let user = viewModel.post.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    HStack {
                        if let imageURL = viewModel.post.ownerImageURL {
                            KFImage(URL(string: imageURL))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .clipped()
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .clipped()
                                .clipShape(Circle())
                        }
                        VStack (alignment: .leading){
                            Text(viewModel.post.ownerFullname)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.black)
                            Text("Status")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.gray)
                            Text(viewModel.timestamp)
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.leading, 20)
                }
            }
            
            Text(viewModel.post.caption)
                .font(.system(size: 14, weight: .medium))
                .padding(.leading, 20)
                .padding(.bottom, 0.5)
            
            KFImage(URL(string: viewModel.post.imageURL))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 400)
                .clipped()
            
            HStack {
                Image(systemName: "hand.thumbsup.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 15, height: 15)
                Text(viewModel.likeText)
                    .font(.system(size: 12, weight: .light))
                
            }
            .padding([.leading, .top, .bottom], 8)
            
            Divider()
            
            HStack {
                Button {
                    didLike ? viewModel.unlike() : viewModel.like()
                } label: {
                    VStack {
                        Image(systemName: didLike ? "hand.thumbsup.fill" : "hand.thumbsup")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.black)
                        Text("Like")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.black)
                    }
                }
                .padding(.trailing, 30)
                .padding(.leading, 35)
                
                
                    VStack {
                        Image(systemName: "text.bubble")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.black)
                        Text("Comment")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.black)
                    }
                    .padding([.leading, .trailing], 30)
                
                
                VStack {
                    Image(systemName: "arrow.turn.up.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15, height: 15)
                    Text("Share")
                        .font(.system(size: 12, weight: .medium))
                }
                .padding([.leading, .trailing], 30)
                
                VStack {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15, height: 15)
                    Text("Send")
                        .font(.system(size: 12, weight: .medium))
                }
                .padding([.leading, .trailing], 30)
            }
        }
        .padding([.top, .bottom], 10)
        .background(Color.white)
    }
}
