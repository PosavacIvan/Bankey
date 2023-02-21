//
//  MainViewController.swift
//  Bankey
//
//  Created by Ivan Posavac on 21.02.2023..
//

import Foundation
import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }
    
    private func setupViews() {
        //Definirani viewControlleri
        let summaryVC = AccountSummaryViewController()
        let moneyVC = MoveMOneyViewController()
        let moreVC = MoreViewController()
        
        //Postavljanje tab bar slike i naslova za pojedini viewController koji je gore kreiran
        summaryVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        moneyVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move money")
        moreVC.setTabBarImage(imageName: "ellipsis.circle", title: "More")
        
        //Definiranje navigation controllera koji se root-aju is Pojedinog view controllera
        let summaryNC = UINavigationController(rootViewController:  summaryVC)
        let moneyNC = UINavigationController(rootViewController:  moneyVC)
        let moreNC = UINavigationController(rootViewController:  moreVC)
        
        summaryNC.navigationBar.barTintColor = appColor
        hideNavigationBarLine(summaryNC.navigationBar)
        
        //Lista VC koji trebaju biti prikazani
        let tabBarList = [summaryVC, moneyNC, moreNC]
        
        //Prikaz
        viewControllers = tabBarList
    }
    
    //Inace postoji tanka linija izmedu navigation controllera koja oznacava kao header s ovom funkcijom ju micemo
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupTabBar() {
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
    }
}

class AccountSummaryViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemGreen
    }
}

class MoveMOneyViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
    }
}

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
}
