//
//  HERApp.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//

import SwiftUI
import Firebase
@main
struct HERApp: App {
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    
    init(){
        FirebaseApp.configure()
    }

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
//            let obs = Observer()
            
            ContentView().environmentObject(AuthViewModel.shared)

//            InitialView().environmentObject(obs)
//                .environment(\.colorScheme, isDarkMode ? .light : .light)
//                .preferredColorScheme(isDarkMode ? .light : .light)

        }
    }
}



class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    @AppStorage("userName") var StoredUser = ""
    @AppStorage("log_Status") var logStatus = false

    func userNotificationCenter(
         _ center: UNUserNotificationCenter,
         willPresent notification: UNNotification,
         withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions)
         -> Void) {
         completionHandler([.alert, .badge, .sound])
     }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        FirebaseApp.configure()
        UNUserNotificationCenter.current().delegate = self
    
        
        
        return true
    }
}




