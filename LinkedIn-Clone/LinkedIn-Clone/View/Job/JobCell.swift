//
//  JobCell.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 14/11/2564 BE.
//

import SwiftUI

struct JobCell: View {
    @State var detailPresented = false
    var body: some View {
        HStack(alignment: .top) {
            Image("Anchilee")
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .clipped()
                .clipShape(Circle())
                .padding(.top, 5)
            VStack(alignment: .leading) {
                Text("Job Name")
                    .font(.system(size: 18, weight: .semibold))
                Text("Job Poster")
                    .font(.system(size: 17, weight: .light))
                Text("Location")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.gray)
                Text("2 days ago")
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.gray)
            }
            .padding(.top, 5)
            VStack {
                Button {
                    //didFollow ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text("Apply")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 110, height: 30)
                        .foregroundColor(Color.blue)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                }
                .padding(.top, 5)
                .padding(.leading, 70)
                
                Button {
                    //didFollow ? viewModel.unfollow() : viewModel.follow()
                    detailPresented.toggle()
                } label: {
                    Text("View Detail")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 110, height: 30)
                        .foregroundColor(Color.gray)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                }
                .padding(.top, 5)
                .padding(.leading, 70)
                .sheet(isPresented: $detailPresented) {
                    JobDetail()
                } 
            }
            
        }
        .onTapGesture {
            
        }
    }
}

struct JobCell_Previews: PreviewProvider {
    static var previews: some View {
        JobCell()
    }
}
