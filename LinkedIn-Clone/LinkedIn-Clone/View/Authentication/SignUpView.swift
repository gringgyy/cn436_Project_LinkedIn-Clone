//
//  SignUpView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 14/11/2564 BE.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack {
            Image("LinkedIn")
                .resizable()
                .scaledToFit()
                .frame(width: 220, height: 90)
            VStack(alignment: .leading) {
                Text("Full name")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.black)
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 40)
                Text("Email")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.black)
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 40)
                Text("Password")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.black)
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 40)
                    .padding(.bottom, 60)
            }
            
            Button {
                //didFollow ? viewModel.unfollow() : viewModel.follow()
            } label: {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.blue)
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 45)
                    .overlay(
                        Text("Join")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                    )
            }
            
            NavigationLink(
                destination: SignInView().navigationBarHidden(true),
                label: {
                    HStack {
                        Text("Already on LinkedIn?")
                            .font(.system(size: 17, weight: .light))
                            .foregroundColor(.black)
                        Text("Sign in")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.blue)
                    }
                }
            )
                
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
