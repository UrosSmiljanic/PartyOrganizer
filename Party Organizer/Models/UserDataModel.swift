//
//  UserDataModel.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 06/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

import Foundation

struct Users: Codable {
    let profiles: [Profile]
}

struct Profile: Codable {
    let id: Int
    let username, cell: String
    let photo: String
    let email: String
    let gender: Gender
    let aboutMe: String
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

// MARK: Convenience initializers and mutators

extension Users {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Users.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        profiles: [Profile]? = nil
        ) -> Users {
        return Users(
            profiles: profiles ?? self.profiles
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Profile {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Profile.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        id: Int? = nil,
        username: String? = nil,
        cell: String? = nil,
        photo: String? = nil,
        email: String? = nil,
        gender: Gender? = nil,
        aboutMe: String? = nil
        ) -> Profile {
        return Profile(
            id: id ?? self.id,
            username: username ?? self.username,
            cell: cell ?? self.cell,
            photo: photo ?? self.photo,
            email: email ?? self.email,
            gender: gender ?? self.gender,
            aboutMe: aboutMe ?? self.aboutMe
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}