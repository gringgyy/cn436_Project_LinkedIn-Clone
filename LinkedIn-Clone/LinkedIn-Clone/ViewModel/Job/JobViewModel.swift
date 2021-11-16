//
//  JobViewModel.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 17/11/2564 BE.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class JobViewModel: ObservableObject {
    @Published var jobs = [Job]()
    
    init() {
        fetchJobs()
    }
    
    func fetchJobs() {
        Firestore.firestore().collection("jobs").getDocuments { (snap, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let documents = snap?.documents else { return }
            
            self.jobs = documents.compactMap { try? $0.data(as: Job.self) }
        }
    }
}
