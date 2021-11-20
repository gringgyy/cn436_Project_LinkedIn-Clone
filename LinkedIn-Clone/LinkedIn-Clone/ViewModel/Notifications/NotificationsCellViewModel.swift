//
//  NotificationCellViewModel.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 15/11/2564 BE.
//

import SwiftUI
import Firebase

class NotificationsCellViewModel: ObservableObject {
    //@Published var user: User
    @Published var notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
        fetchUser()
        fetchPost()
        fetchJob()
        checkRequest()
        checkConnect()
    }
    
    //fetch
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
            self.notification.post = try? snap?.data(as: Post.self)
        }
    }
    
    func fetchJob() {
        guard let jobID = notification.jobID else { return }
        
        Firestore.firestore().collection("jobs").document(jobID).getDocument { (snap , error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.notification.job = try? snap?.data(as: Job.self)
        }
    }
    
    //request
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
    
    //connection
    func connection() {
        if let didConnect = notification.didConnect, didConnect {
            return
        }
        guard let uid = notification.id else { return }
        UserService.connection(uid: uid) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            NotificationsViewModel.sendNotification(withUID: uid, type: .answerRequest)
            self.notification.didConnect = true
        }
    }
    
    //check
    func checkConnect() {
        guard let uid = notification.id else { return }
        UserService.checkConnect(uid: uid) { didConnect in
            self.notification.didConnect = didConnect
        }
    }
    
    func checkRequest() {
        UserService.checkRequest(uid: notification.uid) { didRequest in
            self.notification.didRequest = didRequest
        }
    }
    /*
    func checkJob() {
        UserService.checkJob(uid: notification.uid) { didApply in
            self.notification.didApply = didApply
        }
    }
    */
    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: notification.timestamp.dateValue(), to: Date()) ?? ""
    }
}

