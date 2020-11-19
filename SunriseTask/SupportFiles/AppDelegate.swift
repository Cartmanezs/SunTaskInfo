//
//  AppDelegate.swift
//  SunriseTask
//
//  Created by Ingvar on 18.11.2020.
//

import UIKit
import GooglePlaces

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSPlacesClient.provideAPIKey("AIzaSyAiqbMQz0wXruTMd4XiulnbQJCzEdneogE")
        
        let barColor: UIColor =  _ColorLiteralType(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        let backgroundColor: UIColor =  _ColorLiteralType(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        let textColor: UIColor =  _ColorLiteralType(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        // Navigation bar background.
        UINavigationBar.appearance().barTintColor = barColor
        UINavigationBar.appearance().tintColor = UIColor.white
        
        // Color and font of typed text in the search bar.
        let searchBarTextAttributes = [NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 16)]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = searchBarTextAttributes as [NSAttributedString.Key : Any]
        // Color of the placeholder text in the search bar prior to text entry.
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: backgroundColor, NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 15)]
        // Color of the default search text.
        let attributedPlaceholder = NSAttributedString(string: "Search", attributes: placeholderAttributes as [NSAttributedString.Key : Any])
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = attributedPlaceholder
        
        
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


}

