//
//  JobCellViewModel.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 17/11/2564 BE.
//

import SwiftUI
import Firebase

class JobCellViewModel: ObservableObject {
    @Published var job: Job
    
    init(job: Job) {
        self.job = job
        fetchUser()
    }
    
    func fetchUser() {
        Firestore.firestore().collection("users").document(job.ownerUID).getDocument { (snap, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.job.user = try? snap?.data(as: User.self)
            guard let userImageURL = self.job.user?.profileImageURL else { return }
            self.job.ownerImageURL = userImageURL
        }
    }
    
    func apply() {
        guard let jobID = job.id else { return }
        guard let userID = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("jobs").document(jobID).collection("job-apply").document(userID).setData([:]) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            Firestore.firestore().collection("users").document(userID).collection("user-apply").document(jobID).setData([:]) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                NotificationsViewModel.sendNotification(withUID: self.job.ownerUID, type: .apply)
                //self.job.apply += 1
                self.job.didApply = true
            }
        }
    }
    
    func checkApply() {
        guard let jobID = job.id else { return }
        guard let userID = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("jobs").document(jobID).collection("job-apply").document(userID).getDocument { (snap , error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let didApply = snap?.exists else { return }
            self.job.didApply = didApply
        }
    }
    
    func cancelApply() {
        
        if let didApply = job.didApply, !didApply {
            return
        }
        
        guard let jobID = job.id else { return }
        guard let userID = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("jobs").document(jobID).collection("job-apply").document(userID).delete() { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            Firestore.firestore().collection("users").document(userID).collection("user-apply").document(jobID).delete() { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                self.job.didApply = false
            }
        }
    }
    
    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: job.timestamp.dateValue(), to: Date()) ?? ""
    }
}


