//
//  CommentsCellView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 15/11/2564 BE.
//

import SwiftUI
import Kingfisher

struct CommentsCellView: View {
    let comment: Comment
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profileImageURL))
                .resizable()
                .scaledToFill()
                .frame(width: 45, height: 45)
                .clipped()
                .clipShape(Circle())
            
            HStack {
                Text(comment.fullname)
                    .font(.system(size: 14, weight: .semibold))
                Text(" \(comment.comment)")
                    .font(.system(size: 14))
                
                Spacer()
                
                Text(comment.timestampText())
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .padding(.trailing)
            }
        }
        .padding(.horizontal)
    }
}

