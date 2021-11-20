//
//  SignInView.swift
//  ZennedAppStore
//
//  Created by Logan Thompson on 11/3/21.
//

import SwiftUI

struct SignInView: View {
  @State var email = ""
  @State var password = ""
  
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Button {
        // TODO: Sign in anonymously
        presentationMode.wrappedValue.dismiss()
      }
        label: { GuestSignInButton() }
      
      Divider().padding(.vertical)
      
      UserInfoForm(email: $email, password: $password)
      
      Button {
        // TODO: Sign in with email & password
        presentationMode.wrappedValue.dismiss()
      }
        label: { SignInButton() }
      .disabled(true)
      
      Button {
        // TODO: Add a new user
        presentationMode.wrappedValue.dismiss()
      }
        label: { SignUpButton() }
        .disabled(true)
        }
    .padding()
  }
}

struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    SignInView()
  }
}


// MARK: - User Info Form
struct UserInfoForm: View {
  @Binding var email: String
  @Binding var password: String
  
  var body: some View {
    VStack(alignment: .center, spacing: 20) {
        Image("11")
        .resizable()
        .frame(width: 100, height: 100, alignment: .center)
      VStack(alignment: .leading, spacing: 10) {
        Text("Email")
              .foregroundColor(.accentColor)
        TextField("Enter your email", text: $email)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .keyboardType(.emailAddress)
      }
      
      VStack(alignment: .leading, spacing: 10) {
        Text("Password")
              .foregroundColor(.accentColor)
        SecureField("Enter a password", text: $password)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .keyboardType(.default)
      }
    }
  }
}

// MARK: - Button Views
struct GuestSignInButton: View {
  var body: some View {
      VStack {
          HStack {
              Spacer()
              Text("Continue as Guest")
                .foregroundColor(Color.white)
              Spacer()
            }
            .padding()
            .background(Color.accentColor)
            .cornerRadius(15)
          Spacer()
  }
  }
}

struct SignUpButton: View {
  @Environment(\.isEnabled) var isEnabled
  
  var body: some View {
    HStack {
      Spacer()
      Text("Sign Up")
            .foregroundColor(isEnabled ? .white : .accentColor)
      Spacer()
    }
    .padding()
    .background(Color.accentColor)
        .opacity(isEnabled ? 1 : 0.5)
    .cornerRadius(15)
  }
}

struct SignInButton: View {
  @Environment(\.isEnabled) var isEnabled
  
  var body: some View {
    HStack {
      Spacer()
      Text("Sign In")
            .foregroundColor(isEnabled ? .white : .accentColor)
      Spacer()
    }
    .padding()
    .background(
      Color("blue-curious")
        .opacity(isEnabled ? 1 : 0.5)
    )
    .cornerRadius(15)
  }
}

// MARK: - Background View
struct SignInBackgroundView: View {
  var body: some View {
    ZStack(alignment: .bottom) {
      Color("grey-iron")
      Image(systemName: "cloud.fill")
        .resizable()
        .scaledToFit()
        .scaleEffect(1.2)
        .offset(y: 30)
        .foregroundColor(Color("blue-azure").opacity(0.1))
    }
    .ignoresSafeArea()
  }
}

