//
//  HTTPMethod.swift
//  DemoApp
//
//  Created by shweta parjane on 25/10/22.
//

import Foundation

public struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    public static let get = HTTPMethod(rawValue: "GET")

    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
