//
//  GitEndPoint.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 08.12.2020.
//

import Foundation

enum NetworkEnvironment {
    case git
}

public enum GitApi {
    case search(text:String, page: Int, perPage: Int = 15)
}

extension GitApi: EndPointType {
    
    var environmentBaseURL: String {
        switch GitNetworkManager.environment {
        case .git: return "https://api.github.com/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    //MARK: - TODO
    var path: String {
        switch self {
        case .search:
            return "search/repositories"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    //MARK: - TODO
    var task: HTTPTask {
        switch self {
        case .search(let text, let page, let perPage):
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: ["q": text, "page": "\(page)", "per_page": "\(perPage)"], additionalHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        return ["User-Agent":"IOS"]
    }
}
