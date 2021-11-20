//
//  UserStatusView.swift
//  ZennedAppStore
//
//  Created by Logan Thompson on 11/3/21.
//


import Firebase
import SwiftUI

struct UserStatusView: View {
  var user: User?
  
  @State var email = ""
  @State var password = ""
  
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    ZStack {
      SignInBackgroundView()
      
      VStack {
        // Current User
        if let user = user {
          ZStack(alignment: .topTrailing) {
            DismissButton()
            CurrentUserView(user: user)
          }
          .ignoresSafeArea()
        }
        
        // No User Signed In
        if user == nil { SignInView() }
      }
      .padding()
    }
  }
}


// MARK: - Dismiss Button
struct DismissButton: View {
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    Button { presentationMode.wrappedValue.dismiss() }
      label: {
        Image(systemName: "xmark.circle.fill")
          .font(.largeTitle)
      }
      .padding()
  }
}
