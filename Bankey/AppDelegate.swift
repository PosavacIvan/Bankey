//
//  AppDelegate.swift
//  Bankey
//
//  Created by Ivan Posavac on 14.02.2023..
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var hasOnboarded = false
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchingOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        dummyViewController.logoutDelegate = self
        
        window?.rootViewController = mainViewController
        
        //Uz pomoc ovoga mozemo oderediti koji tab zelimo da bude prikazan kada se pokrene aplikacija
        mainViewController.selectedIndex = 1
        return true
    }
    
}

//Smooth transition between login screen in to onboarding screen
extension AppDelegate {
    func setRootController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        print("foo - Did login")
        if hasOnboarded {
            setRootController(dummyViewController)
        } else {
            //pozivamo funkciju da napravi tranziciju i kao vrijednost stavljamo ekran na koji da se tranzicija uradi
            setRootController(onboardingContainerViewController)
        }
        
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("foo - Did finish onboarding")
        hasOnboarded = true
        setRootController(dummyViewController)
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        setRootController(loginViewController)
    }
}




