//
//  HTTPError.swift
//  DemoApp
//
//  Created by shweta parjane on 25/10/22.
//

import Foundation

enum HTTPError: Error {
    case urlFailed
    case noData
    case requestError
    case parsingFailed
}
