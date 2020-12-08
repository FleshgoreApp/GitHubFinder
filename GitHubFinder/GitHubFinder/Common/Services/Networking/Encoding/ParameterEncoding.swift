//
//  ParameterEncoding.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 08.12.2020.
//

import Foundation

typealias Parameters = [String: Any]

protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
