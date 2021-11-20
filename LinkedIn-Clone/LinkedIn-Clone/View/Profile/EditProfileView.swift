//
//  EditProfileView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 14/11/2564 BE.
//

import SwiftUI

struct EditProfileView: View {
    @State var status: String
    @State var location: String
    @Binding var user: User
    @Environment(\.presentationMode) var mode
    @ObservedObject var viewModel: EditProfileViewModel
    
    init(user: Binding<User>) {
        _user = user
        viewModel = EditProfileViewModel(user: _user.wrappedValue)
        _status = State(initialValue: _user.status.wrappedValue ?? "")
        _location = State(initialValue: _user.location.wrappedValue ?? "")
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    mode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button(action: {
                    viewModel.saveBio(status: status, location: location)
                }) {
                    Text("Done")
                }
            }
            .padding()
            VStack(alignment: .leading) {
                Text("Edit Profile")
                    .font(.system(size: 30, weight: .bold))
                    .padding(.bottom, 15)
                Text("Status")
                    .font(.system(size: 16, weight: .medium))
                TextArea("Add your status...", text: $status)
                    .frame(width: UIScreen.main.bounds.width / 1.25, height: 60)
                    .padding()
                Text("location")
                    .font(.system(size: 16, weight: .medium))
                TextArea("Add your location...", text: $location)
                    .frame(width: UIScreen.main.bounds.width / 1.25, height: 60)
                    .padding()
            }
            
            Spacer()
        }
        .onReceive(viewModel.$uploadComplete) { complete in
            if complete {
                mode.wrappedValue.dismiss()
                user.status = viewModel.user.status
                user.location = viewModel.user.location
            }
        }
    }
}
