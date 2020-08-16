//
//  SplashViewController.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 13/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit
import Lottie


class SplashViewController: UIViewController {
    @IBOutlet weak var wrapperAnimation: UIView!
    let animationView = AnimationView()
    
    override func viewWillAppear(_ animated: Bool) {
        
        let animation = Animation.named("splash")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        wrapperAnimation.addSubview(animationView)
        animationView.frame = wrapperAnimation.bounds
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        animationView.play(fromProgress: 0,
                           toProgress: 2,
                           loopMode: LottieLoopMode.playOnce,
                           completion: { (finished) in
                            self.openDashboard()
        })
    }
    
    
    func openDashboard(){
        let baseVC = BaseController()
        let vc = baseVC.getVC(sbName: "Main", vcName: "login")
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        window.rootViewController = vc
    }
}
