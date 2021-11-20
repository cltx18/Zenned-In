//
//  OnboardingDataModel.swift
//  Zenned In
//
//  Created by Logan Thompson on 11/2/21.
//

import Foundation

struct OnboardingDataModel {
    var image: String
    var heading: String
    var text: String
}


extension OnboardingDataModel {
    static var data: [OnboardingDataModel] = [
        OnboardingDataModel(image: "11", heading: "Welcome to Zenned In.", text: "Use this app in times when you need to reduce anxiety, increase focus, and get better sleep. We offer hours of mindful, meditation soundscapes with new tracks added weekly."),
        OnboardingDataModel(image: "9", heading: "Conquer your personal challenges and hinderences.", text: "According to research, mindfulness can give you a sense of calm, peace and balance that can benefit both your emotional well-being and your overall health."),
        OnboardingDataModel(image: "12", heading: "Take some time out", text: "Reserve time to yourself and bring mindfulness to your day-to-day activities."),
    ]
}
