//
//  Job.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 17/11/2564 BE.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Job: Decodable, Identifiable {
    @DocumentID var id: String?
    let jobTitle: String
    let jobLocation: String
    let timestamp: Timestamp
    let jobDescription: String
    
    //var apply: Int
    
    let ownerUID: String
    var ownerImageURL: String?
    let ownerFullname: String
    
    var user: User?
    var didApply: Bool? = false
}
