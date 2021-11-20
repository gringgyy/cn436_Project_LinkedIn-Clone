//
//  PostView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI

struct PostView: View {
    @State var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @ObservedObject var viewModel = UploadPostViewModel()
    var body: some View {
            VStack {
                HStack(alignment: .top) {
                    if postImage == nil {
                        Button(action: {
                            imagePickerPresented.toggle()
                        }) {
                            Image(systemName: "plus.viewfinder")
                                .resizable()
                                .frame(width: 96, height: 96)
                                .scaledToFill()
                                .padding(.top)
                                .foregroundColor(.black)
                        }
                        .sheet(isPresented: $imagePickerPresented) {
                            loadImage()
                        } content: {
                            ImagePicker(image: $selectedImage)
                        }
                    } else if let image = postImage {
                        image
                            .resizable()
                            .frame(width: 96, height: 96)
                            .clipped()
                    }
                    TextField("Enter your caption...", text: $captionText)
                }
                .padding()
                
                Button {
                    if let image = selectedImage {
                        viewModel.uploadPost(image: image, caption: captionText)
                        captionText = ""
                        postImage = nil
                    }
                } label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
            }
        }
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}
