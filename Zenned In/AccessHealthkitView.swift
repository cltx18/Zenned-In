//
//  AccessHealthkitView.swift
//  Zenned In
//
//  Created by Logan Thompson on 10/12/21.
//

import SwiftUI

struct AccessHealthKitView: View {
    @State private var healthKitAuthorizedCheck = false
    
    var body: some View {
        VStack {
            Spacer()
            CircleImage(image: Image("default"))
                .frame(width: 25, height: 25)
            Spacer()
                .frame(height: 150)
            Text("Track and update Mindful Minutes")
                .font(.title3)
                .foregroundColor(.accentColor)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 50, alignment: .center)
            Spacer()
                .frame(height: 25)

        Button(action:   {
            HealthKitSetupAssistant.authorizeHealthKit { (authorized, error) in
            guard authorized else {
              let baseMessage = "HealthKit Authorization Failed"
                
              if let error = error {
                print("\(baseMessage). Reason: \(error.localizedDescription)")
              } else {
                print(baseMessage)
              }
              return
            }
            print("HealthKit Successfully Authorized.")
                healthKitAuthorizedCheck = true
          }

      }) {
          if healthKitAuthorizedCheck == false {
              Text("Authorize Healthkit")
                  .bold()
                  .foregroundColor(.white)
          } else {
              Text("Healthkit Authorized")
                  .bold()
                  .foregroundColor(.white)

          }
      }.padding()
                .background(Color.accentColor)
                .clipShape(Capsule())
            Spacer()
        }
    }
}

struct AccessHealthKitView_Previews: PreviewProvider {
    static var previews: some View {
        AccessHealthKitView()
    }
}

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .frame(width: 200, height: 200)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
    
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("default"))
    }
}




