//
//  AuthenticationService.swift
//  MakeItSo
//
//  Created by andrew austin on 6/14/23.
//

import Foundation
import Factory
import FirebaseAuth

public class AuthenticationService {
    @Injected(\.auth) private var auth
    @Published var user: User?
    
    private var authStateHandler: AuthStateDidChangeListenerHandle?
    
    init() {
        registerAuthStateHandler()
        signInAnonymously()
    }
    
    func registerAuthStateHandler() {
        if authStateHandler == nil {
            authStateHandler = auth.addStateDidChangeListener { auth, user in
                self.user = user
            }
        }
    }
    
    func signOut() {
        do {
            try auth.signOut()
            signInAnonymously()
        }
        catch {
            print("Error while trying to signout \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() async -> Bool {
        do {
            try await user?.delete()
            signOut()
            return true
        }
        catch {
            print(error.localizedDescription)
            return false
        }
    }
}

//Mark: - Sign in anonymously

extension AuthenticationService {
    func signInAnonymously() {
        if auth.currentUser == nil {
            print("Nobody is signed in. Try signing in Anonymously!")
            auth.signInAnonymously()
        }
        else {
            if let user = auth.currentUser {
                print("Someone is signed in with \(user.providerID) and User ID \(user.uid)")
            }
        }
    }
}
