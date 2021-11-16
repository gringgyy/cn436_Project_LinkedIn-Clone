//
//  CustomTextField.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 15/11/2564 BE.
//

import SwiftUI

struct CustomTextField: View {
    //let placeholder: Text
    @Binding var text: String
    //let imageName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                TextField("", text: $text)
                    .padding(.leading, 8)
            }
            .padding(.leading)
        }
        .frame(width: UIScreen.main.bounds.width / 1.5, height: 40)
        .background(
            ZStack {
                Color.white
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray, lineWidth: 1.5)
                    )
            }
        )
    }
}

