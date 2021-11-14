//
//  BackgroundView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 14/11/2564 BE.
//

import SwiftUI

struct BackgroundView: View {
    let experiences = Array(1...3)
    let educations = Array(1...3)
    let certs = Array(1...3)
    let volunteers = Array(1...3)
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                Text("Experience")
                    .font(.system(size: 18, weight: .medium))
                    .frame(width: UIScreen.main.bounds.width, height: 60, alignment: .leading)
                    .padding(.leading, 20)
                    .background(.quaternary)
                    .scaledToFill()
                ForEach(experiences, id: \.self) { experience in
                    BackgroundCell()
                        .padding(.top)
                        .padding(.leading, 20)
                }
                
                Text("Education")
                    .font(.system(size: 18, weight: .medium))
                    .frame(width: UIScreen.main.bounds.width, height: 60, alignment: .leading)
                    .padding(.leading, 20)
                    .background(.quaternary)
                    .scaledToFill()
                ForEach(educations, id: \.self) { education in
                    BackgroundCell()
                        .padding(.top)
                        .padding(.leading, 20)
                }
                
                Text("Licenses & certifications")
                    .font(.system(size: 18, weight: .medium))
                    .frame(width: UIScreen.main.bounds.width, height: 60, alignment: .leading)
                    .padding(.leading, 20)
                    .background(.quaternary)
                    .scaledToFill()
                ForEach(certs, id: \.self) { cert in
                    BackgroundCell()
                        .padding(.top)
                        .padding(.leading, 20)
                        
                }
                
                Text("Volunteering")
                    .font(.system(size: 18, weight: .medium))
                    .frame(width: UIScreen.main.bounds.width, height: 60, alignment: .leading)
                    .padding(.leading, 20)
                    .background(.quaternary)
                    .scaledToFill()
                ForEach(volunteers, id: \.self) { volunteer in
                    BackgroundCell()
                        .padding(.top)
                        .padding(.leading, 20)
                }
                
            }

        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
