//
//  File.swift
//  
//
//  Created by JOHN CRISTOBAL on 26/10/22.
//

import Foundation

public struct ClientTokenRequest: Codable {
    public var datacelphone, token, celphone, id: String

    enum CodingKeys: String, CodingKey {
        case datacelphone = "Datacelphone"
        case token = "Token"
        case celphone = "Celphone"
        case id = "Id"
    }

    public init(datacelphone: String, token: String, celphone: String, id: String) {
        self.datacelphone = datacelphone
        self.token = token
        self.celphone = celphone
        self.id = id
    }
}
