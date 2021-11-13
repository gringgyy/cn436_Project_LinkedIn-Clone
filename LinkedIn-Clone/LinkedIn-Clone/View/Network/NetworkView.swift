//
//  NetworkView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI

struct NetworkView: View {
    let items = Array(1...3).map({"Element \($0)"})
    //@Binding var text: String
    
    var layout = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    var body: some View {
        VStack {
            HStack {
                Text("Search...")
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
                   
                }) {
                    Text("Cancel")
                        .foregroundColor(.black)
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
            
            ScrollView {
                LazyVGrid(columns: layout, content: {
                    ForEach(items, id: \.self) { item in
                        NetworkCell()
                    }
                })
            }
        }
    }
}

struct NetworkView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkView()
    }
}
