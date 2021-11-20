//
//  EditProfileViewModel.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 20/11/2564 BE.
//

import SwiftUI
import Firebase

class EditProfileViewModel: ObservableObject {
    var user: User
    @Published var uploadComplete = false
    init(user: User) {
        self.user = user
    }
    
    func saveBio(status: String, location: String) {
        guard let userID = user.id else { return }
        
        Firestore.firestore().collection("users").document(userID).updateData(["status": status]) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.user.status = status
            Firestore.firestore().collection("users").document(userID).updateData(["location": location]) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                self.user.location = location
                self.uploadComplete = true
            }
        }
    }
}
