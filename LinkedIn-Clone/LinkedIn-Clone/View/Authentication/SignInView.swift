//
//  SignInView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 14/11/2564 BE.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        VStack {
            Image("LinkedIn")
                .resizable()
                .scaledToFit()
                .frame(width: 220, height: 90)
            VStack(alignment: .leading) {
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
                        Text("Sign in")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                    )
            }
            
            NavigationLink(
                destination: SignUpView().navigationBarHidden(true),
                label: {
                    HStack {
                        Text("New to LinkedIn?")
                            .font(.system(size: 17, weight: .light))
                            .foregroundColor(.black)
                        Text("Join now")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.blue)
                    }
                }
            )
                
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
