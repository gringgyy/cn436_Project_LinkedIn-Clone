//
//  ProfileHeaderView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 16/11/2564 BE.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State var selectedImage: UIImage?
    @State var imagePickerPresented = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .stroke(.tertiary, lineWidth: 1)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
            .scaledToFill()
            .background(.tertiary)
                    
        LazyVStack(alignment: .leading) {
            ZStack {
                Button {
                    imagePickerPresented.toggle()
                } label: {
                    if let imageURL = viewModel.user.profileImageURL {
                        KFImage(URL(string:  imageURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipped()
                            .clipShape(Circle())
                    } else {
                    Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipped()
                            .clipShape(Circle())
                    }
                }
                .sheet(isPresented: $imagePickerPresented) {
                    loadImage()
                } content: {
                    ImagePicker(image: $selectedImage)
                }
            }
            Text(viewModel.user.fullname)
                .font(.system(size: 30, weight: .bold))
            Text(viewModel.user.status ?? "")
                .font(.system(size: 20, weight: .light))
            Text(viewModel.user.location ?? "")
                .font(.system(size: 15, weight: .light))
            
            Text(" ")

            Text("\(viewModel.user.stats?.connections ?? 0) connections")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.blue)
            
            ProfileButtonView(viewModel: viewModel)
            
        }
        .padding(.leading, 20)
        .padding(.top, -85)
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        viewModel.changeProfileImage(image: selectedImage)
    }
}
