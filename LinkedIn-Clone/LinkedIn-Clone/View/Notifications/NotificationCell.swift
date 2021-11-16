//
//  NotificationCell.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 14/11/2564 BE.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack {
            Image("Anchilee")
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .clipped()
                .clipShape(Circle())
            VStack(alignment: .leading) {
                HStack {
                    Text("Name Surname")
                        .font(.system(size: 15, weight: .light))
                    Text("viewed your profile")
                        .font(.system(size: 15, weight: .semibold))
                }
                
                Button {
                    //didFollow ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text("Connect")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 100, height: 30)
                        .foregroundColor(Color.blue)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
            }
            
        }
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
