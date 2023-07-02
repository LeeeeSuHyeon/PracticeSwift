//
//  AppDelegate.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/06/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
//    // 앱이 실행되고 초기 설정이 완료된 후 호출
//    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        print("willFinishLaunchingWithOptions : 앱이 실행되고 초기 설정이 완료된 후 호출")
//        return true
//    }
//
//    // 앱이 활성화되어 사용자와 상호작용이 가능한 상태가 되었을 때 호출
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        print("applicationDidBecomeActive : 앱이 활성화되어 사용자와 상호작용이 가능한 상태가 되었을 때 호출")
//    }
//
//
//
//    //실행 준비가 모두 끝나고 화면이 사용자에게 보여지기 직전에 호출
//    func applicationDidFinishLaunching(_ application: UIApplication) {
//        print("applicationDidFishLaunching : 앱 실행 준비가 모두 끝나고 화면이 사용자에게 보여지기 직전 호출")
//    }
//
//
//    // 앱이 비활성화되고 포그라운드에서 백그라운드로 전환되기 직전에 호출
//    func applicationWillResignActive(_ application: UIApplication) {
//        print("applicationWillResignActive : 앱이 비활성화되고 포그라운드에서 백그라운드로 전환되기 직전에 호출")
//    }
//
//    // 백그라운드로 전환되었을 때 호출
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        print("applicationDidEnterBackground : 백그라운드로 전환되었을 때 호출")
//    }
//
//
//    // 백그라운드에서 포그라운드로 전환될 때 호출
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        print("applicationWillEnterForeground : 백그라운드에서 포그라운드로 전환될 때 호출")
//    }
//
//    // 앱이 종료되기 직전에 호출
//    func applicationWillTerminate(_ application: UIApplication) {
//        print("applicationWillTerminate : 앱이 종료되기 직전에 호출")
//    }
}

