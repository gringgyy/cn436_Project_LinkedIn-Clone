//
//  SignUpView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 14/11/2564 BE.
//

import SwiftUI

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView {
            VStack {
                Image("LinkedIn")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 90)
                
                VStack(alignment: .leading) {
                    Text("Full name")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.black)
                    CustomTextField(text: $fullname)
                    Text("Email")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.black)
                    CustomTextField(text: $email)
                    Text("Password")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.black)
                    CustomSecureField(text: $password)
                        .padding(.bottom, 60)
                }
                
                Button {
                    viewModel.register(withEmail: email, password: password, fullname: fullname)
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
                //.padding(.bottom, 30)
                
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
                    .padding(.top, 30)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(AuthViewModel.shared)
    }
}
