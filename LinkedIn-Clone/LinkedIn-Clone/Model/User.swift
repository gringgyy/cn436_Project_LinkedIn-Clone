//
//  User.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 15/11/2564 BE.
//

import Firebase
import FirebaseFirestoreSwift

struct User: Decodable, Identifiable {
    let email: String
    let fullname: String
    var profileImageURL: String?
    @DocumentID var id: String?
    var stats: UserStatsData?
    
    mutating func updateProfileImageURL(url: String) {
        profileImageURL = url
    }
    
    var isCurrentUser: Bool {
        AuthViewModel.shared.userSession?.uid == id
    }
    var didRequest: Bool? = false
    var didConnect: Bool? = false
    var status: String?
    var location: String?
}

struct UserStatsData: Decodable {
    var connections: Int
}

