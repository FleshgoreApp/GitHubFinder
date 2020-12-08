//
//  HTTPTask.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 08.12.2020.
//

import Foundation

typealias HTTPHeaders = [String: String]

enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionalHeaders: HTTPHeaders?)
}
