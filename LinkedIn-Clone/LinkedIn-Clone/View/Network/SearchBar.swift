//
//  SearchBar.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 15/11/2564 BE.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .font(.system(size: 15, weight: .medium))
                .frame(width:(UIScreen.main.bounds.width / 2), height: 35)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 5)
                    }
                )
            
            Button(action: {
                isEditing = false
                text = ""
                UIApplication.shared.endEditing()
            }) {
                Text("Cancel")
                    .foregroundColor(.black)
            }
            .padding(.trailing, 8)
            .transition(.move(edge: .trailing))
            .animation(.default)
        }
        .onTapGesture {
            isEditing = true
        }
    }
}
