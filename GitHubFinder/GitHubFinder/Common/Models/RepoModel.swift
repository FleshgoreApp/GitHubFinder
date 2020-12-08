//
//  RepoModel.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 08.12.2020.
//

import Foundation

protocol iRepoModel {
    var description: String { get }
    var detailsDescription: String { get }
}

struct RepoModel {
    let id: Int
    let name: String
    let fullName: String
    let stargazersCount: Int
}

extension RepoModel: iRepoModel {
    var description: String {
        return "\(name): stargazers count \(stargazersCount)"
    }
    
    var detailsDescription: String {
        return "ID: \(id)\n Name: \(name)\n Full name: \(fullName)\n Stargazers count: \(stargazersCount)\n"
    }
}

extension RepoModel: Comparable {
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.stargazersCount < rhs.stargazersCount
    }
    static func > (lhs: Self, rhs: Self) -> Bool {
        return lhs.stargazersCount > rhs.stargazersCount
    }
}

extension RepoModel: Decodable {
    private enum GitRepoCodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case fullName = "full_name"
        case stargazersCount = "stargazers_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: GitRepoCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        fullName = try container.decode(String.self, forKey: .fullName)
        stargazersCount = try container.decode(Int.self, forKey: .stargazersCount)
    }
}

struct GitApiResponse {
    let totalCount: Int
    var items: [RepoModel]
}

extension GitApiResponse: Decodable {
    private enum GitApiResponseCodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items = "items"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: GitApiResponseCodingKeys.self)
        
        totalCount = try container.decode(Int.self, forKey: .totalCount)
        items = try container.decode([RepoModel].self, forKey: .items)
    }
}
