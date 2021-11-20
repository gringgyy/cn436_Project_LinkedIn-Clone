//
//  ProfileViewModel.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 15/11/2564 BE.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkRequest()
        checkConnect()
        checkStats()
    }
    
    func changeProfileImage(image: UIImage) {
        ImageUploader.uploadImage(image: image, type: .profile) { imageURL in
            guard let uid = self.user.id else { return }
            Firestore.firestore().collection("users").document(uid).updateData([
                "profileImageURL": imageURL
            ]) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                self.user.updateProfileImageURL(url: imageURL)
            }
        }
    }
    
    func request() {
        if let didRequest = user.didRequest, didRequest {
            return
        }
        guard let uid = user.id else { return }
        UserService.request(uid: uid) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            NotificationsViewModel.sendNotification(withUID: uid, type: .request)
            self.user.didRequest = true
        }
    }
    
    
    func cancelRequest() {

        if let didRequest = user.didRequest, !didRequest {
            return
        }
        guard let uid = user.id else { return }
        UserService.cancelRequest(uid: uid) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.user.didRequest = false
            self.user.didConnect = false
        }
    }
    
    func connection() {
        if let didConnect = user.didConnect, didConnect {
            return
        }
        guard let uid = user.id else { return }
        UserService.connection(uid: uid) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            NotificationsViewModel.sendNotification(withUID: uid, type: .answerRequest)
            self.user.didConnect = true
        }
    }
    
    func checkConnect() {
        guard let uid = user.id else { return }
        UserService.checkConnect(uid: uid) { didConnect in
            self.user.didConnect = didConnect
        }
    }
    
    func checkRequest() {
        guard let uid = user.id else { return }
        UserService.checkRequest(uid: uid) { didRequest in
            self.user.didRequest = didRequest
        }
    }
    
    func checkStats() {
        guard let uid = user.id else { return }
        
        Firestore.firestore().collection("connections").document(uid).collection("user-connections").getDocuments { (snap , error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let connections = snap?.documents.count else { return }
            
            self.user.stats = UserStatsData(connections: connections)
        }
    }
}


