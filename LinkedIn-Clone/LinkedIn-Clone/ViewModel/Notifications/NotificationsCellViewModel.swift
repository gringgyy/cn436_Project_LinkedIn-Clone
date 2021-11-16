//
//  NotificationCellViewModel.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 15/11/2564 BE.
//

import SwiftUI
import Firebase

class NotificationsCellViewModel: ObservableObject {
    @Published var notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
        fetchUser()
        fetchPost()
        checkRequest()
    }
    
    func fetchUser() {
        Firestore.firestore().collection("users").document(notification.uid).getDocument { (snap , error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.notification.user = try? snap?.data(as: User.self)
        }
    }
    
    func fetchPost() {
        guard let postID = notification.postID else { return }
        
        Firestore.firestore().collection("posts").document(postID).getDocument { (snap , error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.notification.user = try? snap?.data(as: User.self)
        }
    }
    
    func request() {
        if let didRequest = notification.didRequest, didRequest {
            return
        }
        
        UserService.request(uid: notification.uid) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            NotificationsViewModel.sendNotification(withUID: self.notification.uid, type: .request)
            self.notification.didRequest = true
        }
    }
    
    func cancelRequest() {
        if let didRequest = notification.didRequest, !didRequest {
            return
        }
        
        UserService.cancelRequest(uid: notification.uid) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.notification.didRequest = false
        }
    }
    
    func checkRequest() {
        UserService.checkRequest(uid: notification.uid) { didRequest in
            self.notification.didRequest = didRequest
        }
    }
    
    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: notification.timestamp.dateValue(), to: Date()) ?? ""
    }
}

