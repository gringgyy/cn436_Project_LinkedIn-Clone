//
//  AddJobButtonView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 17/11/2564 BE.
//

import SwiftUI

struct AddJobButtonView: View {
    @ObservedObject var viewModel: JobViewModel
    @State var addJobPresented = false
    var body: some View {
        Button {
            //didFollow ? viewModel.unfollow() : viewModel.follow()
            addJobPresented.toggle()
        } label: {
            Text("Create Job")
                .font(.system(size: 16, weight: .semibold))
                .frame(width: 175, height: 35)
                .foregroundColor(Color.blue)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.blue, lineWidth: 2)
                )
        }
        .sheet(isPresented: $addJobPresented) {
            AddJobView()
        }
    }
}
