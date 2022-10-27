//
//  BaseViewModel.swift
//  DemoApp
//
//  Created by shweta parjane on 25/10/22.
//

import UIKit

class BaseViewModel: NSObject {
    override init() {
        super.init()
        callService()
    }

    public func callService() {
        // childs should implement this
    }
}
