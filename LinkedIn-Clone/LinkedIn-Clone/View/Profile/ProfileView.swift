//
//  ProfileView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            RoundedRectangle(cornerRadius: 0)
                .stroke(.tertiary, lineWidth: 1)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
                .scaledToFill()
                .background(.tertiary)
            
            LazyVStack(alignment: .leading) {
                
                Image("Anchilee")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipped()
                    .clipShape(Circle())
                Text("Name Surname")
                    .font(.system(size: 30, weight: .bold))
                Text("Status")
                    .font(.system(size: 20, weight: .light))
                Text("Location")
                    .font(.system(size: 15, weight: .light))
                
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
                    } label: {
                        Text("Post")
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
                }
                
                
            }
            .padding(.leading, 20)
            .padding(.top, -85)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
