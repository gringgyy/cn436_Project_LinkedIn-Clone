//
//  NetworkCell.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 13/11/2564 BE.
//

import SwiftUI

struct NetworkCell: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(.tertiary, lineWidth: 1)
            .frame(width:(UIScreen.main.bounds.width / 2)-20, height: (UIScreen.main.bounds.width / 2)+40)
            .scaledToFill()
            .background(.white)
            //.padding(.horizontal, 5)
            //.padding(.vertical, 5)
            .overlay(
                VStack {
                    Group {
                        Image("Anchilee")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipped()
                            .clipShape(Circle())
                            .padding(.top, 20)
                        Text("Name Surname")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                        Text("Status")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button {
                        //didFollow ? viewModel.unfollow() : viewModel.follow()
                    } label: {
                        Text("Connect")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 35)
                            .foregroundColor(Color.blue)
                            .background(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                    .cornerRadius(30)
                    .padding(.bottom, 20)
                }
            )
    }
}

struct NetworkCell_Previews: PreviewProvider {
    static var previews: some View {
        NetworkCell()
    }
}
