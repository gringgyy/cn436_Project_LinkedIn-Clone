//
//  ChatRowView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 16/11/2564 BE.
//

import SwiftUI
import Kingfisher

struct ChatRowView: View {
    let message: Message
    
    var ownAccount: Bool {
        message.senderID == AuthViewModel.shared.userSession?.uid
    }
    var body: some View {
        HStack(spacing: 15) {
            if !ownAccount {
                if let imageURL = message.ownerImageURL {
                    KFImage(URL(string: imageURL))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .clipped()
                        .clipShape(Circle())
                }
            }
            
            if ownAccount {
                Spacer(minLength: 0)
            }
            
            VStack(alignment: ownAccount ? .trailing : .leading, spacing: 5) {
                Text(message.message)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Rectangle())
                
                Text(message.timestampText())
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(ownAccount ? .trailing : .leading, 10)
            }
            
            if !ownAccount {
                Spacer(minLength: 0)
            }
            
            if ownAccount {
                if let imageURL = message.ownerImageURL {
                    KFImage(URL(string: imageURL))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .clipped()
                        .clipShape(Rectangle())
                }
            }
        }
        .padding()
    }
}
