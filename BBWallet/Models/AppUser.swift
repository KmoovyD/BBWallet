//
//  AppUser.swift
//  BBWallet
//
//  Created by Leo Friskey on 24.11.2022.
//

import Foundation


struct AppUser: Codable, Identifiable {
    let id: String
    let email: String
    let username: String
    let password: String

    init(email: String, username: String = "BBUser", password: String) {
        self.id = email
        self.email = email
        self.username = username
        self.password = password
    }
    
    enum CodingKeys: CodingKey {
        case id, email, username, password
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(email, forKey: .email)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.email = try container.decode(String.self, forKey: .email)
        self.username = try container.decode(String.self, forKey: .username)
        self.password = try container.decode(String.self, forKey: .password)
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else { return nil }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

extension AppUser: RawRepresentable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8), let result = try? JSONDecoder().decode(AppUser.self, from: data) else { return nil }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self), let result = String(data: data, encoding: .utf8) else { return "nil" }
        return result
    }
}
