//
//  Zenned_InApp.swift
//  Zenned In
//
//  Created by Logan Thompson on 10/12/21.
//


import Firebase
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    
    let data = OurData()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    return true
    }
}

@main
struct AppMain: App {
    let data = OurData()
    init() {
    FirebaseApp.configure()
    data.loadAlbums()
    }
    
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  var body: some Scene {
    WindowGroup {
        ContentView(data: data)
    }
  }
}
