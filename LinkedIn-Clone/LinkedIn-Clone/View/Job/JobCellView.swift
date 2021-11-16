//
//  JobCell.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 14/11/2564 BE.
//

import SwiftUI
import Kingfisher

struct JobCellView: View {
    @ObservedObject var viewModel: JobCellViewModel
    
    @State var detailPresented = false
    
    var didApply: Bool {
        viewModel.job.didApply ?? false
    }
    var body: some View {
        HStack(alignment: .top) {
            
            if let imageURL = viewModel.job.ownerImageURL {
                KFImage(URL(string:  imageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 65)
                    .clipped()
                    .clipShape(Circle())
                    .padding(.top, 5)
            } else {
            Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 65)
                    .clipped()
                    .clipShape(Circle())
                    .padding(.top, 5)
            }
            
            VStack(alignment: .leading) {
                Text(viewModel.job.jobTitle)
                    .font(.system(size: 18, weight: .semibold))
                Text(viewModel.job.ownerFullname)
                    .font(.system(size: 17, weight: .light))
                Text(viewModel.job.jobLocation)
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.gray)
                Text(viewModel.timestamp)
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.gray)
            }
            .padding(.top, 5)
            VStack {
                Button {
                    didApply ? viewModel.cancelApply() : viewModel.apply()
                } label: {
                    Text("Apply")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 100, height: 30)
                        .foregroundColor(Color.blue)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
                .padding(.top, 5)
                .padding(.leading, 70)
                
                Button {
                    detailPresented.toggle()
                } label: {
                    Text("View Detail")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 100, height: 30)
                        .foregroundColor(Color.gray)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                .padding(.top, 5)
                .padding(.leading, 70)
                .sheet(isPresented: $detailPresented) {
                    JobDetailView()
                } 
            }
            
        }
        .onTapGesture {
            
        }
    }
}
