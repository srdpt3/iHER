//
//  HERApp.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//

import SwiftUI
import Firebase
import StreamChat
@main
struct HERApp: App {
    @AppStorage("isDarkMode") var isDarkMode: Bool = true

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            let obs = Observer()

            InitialView().environmentObject(obs)
                .environment(\.colorScheme, isDarkMode ? .light : .light)
                .preferredColorScheme(isDarkMode ? .light : .light)

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
        FirebaseApp.configure()
        UNUserNotificationCenter.current().delegate = self
        
        let config = ChatClientConfig(apiKeyString: "m39hdtsxmbce")
        
        if logStatus {
            ChatClient.shared = ChatClient(config: config, tokenProvider: .development(userId: StoredUser))
            
        }else{
            ChatClient.shared = ChatClient(config: config, tokenProvider: .anonymous)

        }
        
        
        return true
    }
}

extension ChatClient {
    static var shared : ChatClient!
    
}


