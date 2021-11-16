//
//  AuthViewModel.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 15/11/2564 BE.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: Firebase.User?
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func signIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = result?.user else { return }
            
            print("userSession: \(user)")
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
        print("sign out!")
    }
    
    func register(withEmail email: String, password: String, fullname: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = result?.user else { return }
            
            let data = [
                "email": email,
                "fullname": fullname,
                "uid": user.uid
            ]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                self.userSession = user
                self.fetchUser()
            }
        }
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { (snap, error) in
            if let error = error {
                print(error.localizedDescription)
                print("error")
                return
            }
            guard let user = try? snap?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
}

