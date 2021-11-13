//
//  HomeCell.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI

struct HomeCell: View {
    //var postImage: String
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Image("Anchilee")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipped()
                    .clipShape(Circle())
                VStack (alignment: .leading){
                    Text("Name Surname")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                    Text("Status")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.gray)
                    Text("2H")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.gray)
                }
                
                
            }
            .padding(.leading, 20)
            
            
            Text("Ann Anchilee Scott-Kemmis THAILAND")
                .font(.system(size: 14, weight: .medium))
                .padding(.leading, 20)
                .padding(.bottom, 0.5)
            Image("Anchilee")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 400)
                .clipped()
            
            HStack {
                Image(systemName: "hand.thumbsup.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 15, height: 15)
                Text("24")
                    .font(.system(size: 12, weight: .light))
            }
            .padding([.leading, .top, .bottom], 8)
            
            Divider()
            
            HStack {
                VStack {
                    Image(systemName: "hand.thumbsup")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15, height: 15)
                    Text("Like")
                        .font(.system(size: 12, weight: .medium))
                }
                .padding(.trailing, 30)
                .padding(.leading, 35)
                
                VStack {
                    Image(systemName: "text.bubble")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15, height: 15)
                    Text("Comment")
                        .font(.system(size: 12, weight: .medium))
                }
                .padding([.leading, .trailing], 30)
                
                VStack {
                    Image(systemName: "arrow.turn.up.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15, height: 15)
                    Text("Share")
                        .font(.system(size: 12, weight: .medium))
                }
                .padding([.leading, .trailing], 30)
                
                VStack {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15, height: 15)
                    Text("Send")
                        .font(.system(size: 12, weight: .medium))
                }
                .padding([.leading, .trailing], 30)
            }
        }
        .padding([.top, .bottom], 10)
        .background(Color.white)
    }
}

struct HomeCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeCell()
    }
}
