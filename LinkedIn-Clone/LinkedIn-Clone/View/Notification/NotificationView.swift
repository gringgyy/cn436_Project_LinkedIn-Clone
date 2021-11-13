//
//  NotificationView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI

struct NotificationView: View {
    let notifications = Array(1...3)
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(notifications, id: \.self) { notification in
                    NotificationCell()
                        .padding(.top)
                }
            }
            .padding(.leading, 20)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
