//
//  OnboardingStepView.swift
//  Zenned In
//
//  Created by Logan Thompson on 11/2/21.
//


import SwiftUI

struct OnboardingStepView: View {
    var data: OnboardingDataModel
    
    var body: some View {
        VStack {
            Spacer()
            Image(data.image)
                .resizable()
                .scaledToFit()
                .padding(.bottom, 50)
            
            Text(data.heading)
                .font(.system(size: 25, design: .rounded))
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            Text(data.text)
                .font(.system(size: 17, design: .rounded))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            Spacer()
        }
    .padding()
    }
}

struct OnboardingStepView_Previews: PreviewProvider {
    static var data = OnboardingDataModel.data[0]
    static var previews: some View {
        OnboardingStepView(data: data)
    }
}
