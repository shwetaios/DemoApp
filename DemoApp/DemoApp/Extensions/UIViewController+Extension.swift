//
//  UIViewController+Extension.swift
//  DemoApp
//
//  Created by shweta parjane on 25/10/22.
//

import Foundation
import UIKit

extension UIViewController {

    func showNotification(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: Constant.alertButton, style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
}
