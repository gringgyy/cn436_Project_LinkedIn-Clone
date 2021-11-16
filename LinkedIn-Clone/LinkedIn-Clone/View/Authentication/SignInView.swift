//
//  SignInView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 14/11/2564 BE.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView {
            VStack {
                Image("LinkedIn")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 90)
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.black)
                    CustomTextField(text: $email)
                        //.padding()
                        //.padding(.horizontal, 32)
                    Text("Password")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.black)
                    CustomSecureField(text: $password)
                        .padding(.bottom, 60)
                    
                }
                
                Button {
                    viewModel.signIn(withEmail: email, password: password)
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
                //Spacer()
                
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
                        .padding(.top, 30)
                    }
                )
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(AuthViewModel.shared)
    }
}
