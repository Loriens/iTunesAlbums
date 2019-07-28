//
//  ModuleTransitionable.swift
//  iTunesAlbums
//
//  Created by Vladislav on 28/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

protocol ModuleTransitionable: AnyObject {
    func showModule(_ module: UIViewController)
    func dismissView(animated: Bool, completion: (() -> Void)?)
    func presentModule(_ module: UIViewController, animated: Bool, completion: (() -> Void)?)
    func pop(animated: Bool)
    func push(module: UIViewController, animated: Bool)
    func push(module: UIViewController, animated: Bool, hideTabBar: Bool)
}

extension ModuleTransitionable where Self: UIViewController {
    
    func showModule(_ module: UIViewController) {
        self.show(module, sender: nil)
    }
    
    func dismissView(animated: Bool, completion: (() -> Void)?) {
        self.presentingViewController?.dismiss(animated: animated, completion: completion)
    }
    
    func presentModule(_ module: UIViewController, animated: Bool, completion: (() -> Void)?) {
        self.present(module, animated: animated, completion: completion)
    }
    
    func pop(animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }
    
    func push(module: UIViewController, animated: Bool) {
        self.navigationController?.pushViewController(module, animated: animated)
    }
    
    func push(module: UIViewController, animated: Bool, hideTabBar: Bool = false) {
        module.hidesBottomBarWhenPushed = hideTabBar
        push(module: module, animated: animated)
    }
    
}
