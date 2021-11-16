//
//  Comments.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 15/11/2564 BE.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Comment: Decodable, Identifiable {
    @DocumentID var id: String?
    let comment: String
    let uid: String
    let timestamp: Timestamp
    let postOwnerID: String
    let fullname: String
    let profileImageURL: String
    
    func timestampText() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
}
