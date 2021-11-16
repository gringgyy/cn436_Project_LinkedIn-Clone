//
//  Notification.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 15/11/2564 BE.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Notification: Decodable, Identifiable {
    @DocumentID var id: String?
    var postID: String?
    var jobID: String?
    var fullname: String
    var profileImageURL: String?
    var timestamp: Timestamp
    var uid: String
    var type: NotificationType
    
    var post: Post?
    var job: Job?
    var user: User?
    var didRequest: Bool? = false
}

enum NotificationType: Int, Decodable {
    case request
    case like
    case comment
    case view
    case apply
    case answerRequest
    
    var notificationMessage: String {
        switch self {
        case .request:
            return " sent you a request."
        case .like:
            return " liked one of your posts."
        case .comment:
            return " commented on one of your posts."
        case .view:
            return " viewed your profile."
        case .apply:
            return " apply to your job."
        case .answerRequest:
            return " answer your request. You are now connect to each other."
        }
    }
}

