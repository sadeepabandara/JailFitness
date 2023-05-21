//
//  TabBarViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-05-20.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: ScheduleViewController())
        let vc3 = UINavigationController(rootViewController: ProgressViewController())
        let vc4 = UINavigationController(rootViewController: ProfileViewController())
        vc1.title = "My Plan"
        vc2.title = "Schedule"
        vc3.title = "Progress"
        vc4.title = "Profile"
        
        self.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
        
        let blurEffect = UIBlurEffect(style: .dark)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = tabBar.bounds
            blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        self.tabBar.insertSubview(blurView, at: 0)
        
        guard let items = self.tabBar.items else {
            return
        }
        
        let images = ["dumbbell.fill", "doc.plaintext.fill", "chart.bar.xaxis", "person.fill"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
            items[x].badgeColor = UIColor.white
        }
        
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.tintColor = customYellow
        tabBarAppearance.unselectedItemTintColor = .white
        
        self.modalPresentationStyle = .fullScreen
    }
}
