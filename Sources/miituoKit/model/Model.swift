//
//  File.swift
//  
//
//  Created by JOHN CRISTOBAL on 24/10/22.
//

import Foundation

public struct AppError {
    public let message: String
    
    public init(message: String) {
        self.message = message
    }
}

public struct MessageResponse : Codable {
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case message = "Message"
    }
    
    public init(message: String){
        self.message = message
    }
}
