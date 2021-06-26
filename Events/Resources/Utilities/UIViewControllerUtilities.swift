//
//  UIViewControllerUtilities.swift
//  Events
//
//  Created by Lourdes on 6/26/21.
//

import UIKit

extension UIViewController {
    static func initiateVC() -> Self? {
        let storyBoard = UIStoryboard(name: String(describing: self), bundle: Bundle.main)
        
        return storyBoard.instantiateViewController(withIdentifier: String(describing: self)) as? Self
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
