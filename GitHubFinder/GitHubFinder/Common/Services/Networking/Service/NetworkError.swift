//
//  NetworkError.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 08.12.2020.
//

import Foundation

enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
}
