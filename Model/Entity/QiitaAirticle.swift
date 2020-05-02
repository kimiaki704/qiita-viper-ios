//
//  QiitaAirticle.swift
//  Model
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//

public struct QiitaArticle: Codable {
    public let id: String
    public let title: String
    public let url: String
    public let userID: String
    public let userName: String
    public let userImgURL: String
    public let createdAt: String

    private enum CodingKeys: String, CodingKey {
        case id
        case user
        case title
        case url
        case createdAt = "created_at"
    }

    private enum NestedKeys: String, CodingKey {
        case id = "permanent_id"
        case name
        case imgURL = "profile_image_url"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        url = try container.decode(String.self, forKey: .url)
        createdAt = try container.decode(String.self, forKey: .createdAt)

        let user = try container.nestedContainer(keyedBy: NestedKeys.self, forKey: .user)
        userID = try user.decode(String.self, forKey: .name)
        userName = try user.decode(String.self, forKey: .name)
        userImgURL = try user.decode(String.self, forKey: .imgURL)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(url, forKey: .url)
        try container.encode(createdAt, forKey: .createdAt)

        var user = container.nestedContainer(keyedBy: NestedKeys.self, forKey: .user)
        try user.encode(userID, forKey: .id)
        try user.encode(userName, forKey: .name)
        try user.encode(userImgURL, forKey: .imgURL)
    }
}
