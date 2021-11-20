//
//  NotificationView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var viewModel = NotificationsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.notifications) { notification in
                    NotificationCell(viewModel: NotificationsCellViewModel(notification: notification))
                        .padding(.top)
                    //Text("1")
                }
            }
            //.padding(.leading, 20)
        }
        
    }
}
