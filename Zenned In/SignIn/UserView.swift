//
//  UserView.swift
//  ZennedAppStore
//
//  Created by Logan Thompson on 11/3/21.
//


import Firebase
import SwiftUI

struct CurrentUserView: View {
  var user: User
  
  var body: some View {
    HStack {
      Spacer()
      
      VStack(spacing: 20) {
        if user.isAnonymous {
          Text("""
            You are currently
            signed in as a Guest
            """
          )
          .font(.title2)
          .multilineTextAlignment(.center)
          .padding()
        } else {
          VStack(spacing: 20) {
            Text("You are currently signed in as:")
            Text(user.email ?? "")
              .font(.title)
          }
          .padding()
        }
        
        Button { AuthenticationService.signOut() }
          label: { SignOutButton() }
        
        Spacer()
      }
      
      Spacer()
    }
    .padding()
  }
  
  struct SignOutButton: View {
    var body: some View {
      HStack {
        Text("Sign Out")
          .foregroundColor(Color.white)
      }
      .padding()
      .background(Color("blue-curious"))
      .cornerRadius(15)
    }
  }
}
