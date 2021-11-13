//
//  JobView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI

struct JobView: View {
    let notifications = Array(1...3)
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(notifications, id: \.self) { notification in
                    JobCell()
                        .padding(.top)
                }
            }
            .padding(.leading, 20)
        }
    }
}

struct JobView_Previews: PreviewProvider {
    static var previews: some View {
        JobView()
    }
}
