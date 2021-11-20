//
//  JobDetailViewModel.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 18/11/2564 BE.
//

import SwiftUI
import Firebase

class addJobViewModel: ObservableObject {
    
    func addJob(jobTitle: String, jobLocation: String, jobDescription: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        guard let uid = user.id else { return }
            
            let data = [
                "jobTitle": jobTitle,
                "jobLocation": jobLocation,
                "jobDescription": jobDescription,
                "timestamp": Timestamp(date: Date()),
                "ownerUID": uid,
                "ownerFullname": user.fullname
            ] as [String: Any]
            
            Firestore.firestore().collection("jobs").addDocument(data: data) { error in
                if let error = error {
                    print(error)
                    return
                }
        }
    }
}
