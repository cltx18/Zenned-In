//
//  AuthenticationService.swift
//  ZennedAppStore
//
//  Created by Logan Thompson on 11/3/21.
//

import Foundation
import Firebase

class AuthenticationService: ObservableObject {
  @Published var user: User?
  private var authenticationStateHandler: AuthStateDidChangeListenerHandle?

  init() {
    addListeners()
  }
  
  static func signInAnonymously() {
    if Auth.auth().currentUser == nil {
      Auth.auth().signInAnonymously()
    }
  }

  static func signIn(email: String, password: String) {
    if Auth.auth().currentUser != nil {
      do {
        try Auth.auth().signOut()
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
          if let error = error { print(error.localizedDescription) }
        }
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
  static func signOut() {
    do {
      try Auth.auth().signOut()
    } catch {
      print(error.localizedDescription)
    }
  }
  
  static func addNewUser(email: String, password: String) {
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
      if let error = error {
        print("create user error:" + error.localizedDescription)
      } else {
        signIn(email: email, password: password)
      }
    }
  }

  private func addListeners() {
    if let handle = authenticationStateHandler {
      Auth.auth().removeStateDidChangeListener(handle)
    }

    authenticationStateHandler = Auth.auth()
      .addStateDidChangeListener { _, user in
        self.user = user
      }
  }
}
