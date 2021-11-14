//
//  AddBackgroundView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 14/11/2564 BE.
//

import SwiftUI

struct AddBackgroundView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Type")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.black)
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 40)
                Text("Name")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.black)
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 40)
                Text("Location")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.black)
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 40)
                Text("Time")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.black)
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 40)
                Text("Description")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.black)
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 40)
                    .padding(.bottom, 30)
                
            }
            
            Button {
                //didFollow ? viewModel.unfollow() : viewModel.follow()
                dismiss()
            } label: {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.blue)
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 45)
                    .overlay(
                        Text("Add")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                    )
            }
        }
    }
}

struct AddBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        AddBackgroundView()
    }
}
