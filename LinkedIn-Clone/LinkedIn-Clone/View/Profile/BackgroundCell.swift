//
//  BackgroundCell.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 14/11/2564 BE.
//

import SwiftUI

struct BackgroundCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("Anchilee")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipped()
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    
                    Text("NameNameName")
                        .font(.system(size: 17, weight: .semibold))
                    Text("LocationLocation")
                        .font(.system(size: 15, weight: .light))
                    Text("May 2021")
                        .font(.system(size: 15, weight: .light))
                }
            }
            Text("Desciption")
                .font(.system(size: 15, weight: .light))
        }
        
    }
}

struct BackgroundCell_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundCell()
    }
}
