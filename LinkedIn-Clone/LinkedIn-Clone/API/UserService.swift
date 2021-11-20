//
//  UserService.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 15/11/2564 BE.
//

import SwiftUI
import Firebase

struct UserService {
    
    static func request(uid: String, completion: @escaping (Error?) -> Void) {
        guard let currentUID = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("requesting").document(currentUID).collection("user-requesting").document(uid).setData([:]) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            Firestore.firestore().collection("gotRequest").document(uid).collection("user-gotRequest").document(uid).setData([:], completion: completion)
        }
    }
    
    static func cancelRequest(uid: String, completion: @escaping (Error?) -> Void) {
        guard let currentUID = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("requesting").document(currentUID).collection("user-requesting").document(uid).delete() { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            Firestore.firestore().collection("gotRequest").document(uid).collection("user-gotRequest").document(uid).delete(completion: completion)
        }
        
        Firestore.firestore().collection("connections").document(currentUID).collection("user-connections").document(uid).delete() { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            Firestore.firestore().collection("connections").document(uid).collection("user-connections").document(currentUID).delete(completion: completion)
        }
    }
    
    static func applyJob(uid: String, completion: @escaping (Error?) -> Void) {
        guard let currentUID = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("Applying").document(currentUID).collection("user-applying").document(uid).setData([:]) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            Firestore.firestore().collection("gotApply").document(uid).collection("user-gotApply").document(uid).setData([:], completion: completion)
        }
    }
    
    static func cancelApply(uid: String, completion: @escaping (Error?) -> Void) {
        guard let currentUID = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("Applying").document(currentUID).collection("user-applying").document(uid).delete() { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            Firestore.firestore().collection("gotApply").document(uid).collection("user-gotApply").document(uid).delete(completion: completion)
        }
    }
    
    static func connection(uid: String, completion: @escaping (Error?) -> Void) {
        guard let currentUID = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("requesting").document(uid).collection("user-requesting").document(currentUID).getDocument { (snap, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let haveRequest = snap?.exists else { return }
            if haveRequest {
                Firestore.firestore().collection("requesting").document(currentUID).collection("user-requesting").document(uid).getDocument { (snap, error) in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    guard let didConnect = snap?.exists else { return }
                    
                    if didConnect {
                        Firestore.firestore().collection("connections").document(currentUID).collection("user-connections").document(uid).setData([:]) { error in
                            if let error = error {
                                print(error.localizedDescription)
                                return
                            }
                            Firestore.firestore().collection("connections").document(uid).collection("user-connections").document(currentUID).setData([:], completion: completion)
                            
                        }
                    }
                }
            }
        }
    }
    
    static func checkConnect(uid: String, completion: @escaping (Bool) -> Void) {
        guard let currentUID = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("requesting").document(uid).collection("user-requesting").document(currentUID).getDocument { (snap, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let haveRequest = snap?.exists else { return }
            if haveRequest {
                Firestore.firestore().collection("requesting").document(currentUID).collection("user-requesting").document(uid).getDocument { (snap, error) in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    guard let didConnect = snap?.exists else { return }
            
                    completion(didConnect)
                }
            }
        }
    }
    
    static func checkRequest(uid: String, completion: @escaping (Bool) -> Void) {
        guard let currentUID = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("requesting").document(currentUID).collection("user-requesting").document(uid).getDocument { (snap , error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let didRequest = snap?.exists else { return }
            
            completion(didRequest)
        }
    }
    
    static func checkJob(uid: String, completion: @escaping (Bool) -> Void) {
        guard let currentUID = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("applying").document(currentUID).collection("user-applying").document(uid).getDocument { (snap , error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let didApply = snap?.exists else { return }
            
            completion(didApply)
        }
    }
    
}

