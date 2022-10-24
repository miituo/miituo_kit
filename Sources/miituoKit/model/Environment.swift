//
//  File.swift
//  
//
//  Created by JOHN CRISTOBAL on 24/10/22.
//

import Foundation

public enum Environment {
    
    case development
    case qa
    case production
    
    public var url: String {
        switch self {
        case .development:
            return "https://apidev2019.miituo.com/api/"
        case .qa:
            return "https://apiqas2019.miituo.com/api/"
        case .production:
            return "https://api.miituo.com/api/"
        }
    }
    
    public var pathWebSite: String {
        switch self {
        case .development:
            return "https://websitedev2019.miituo.com/"
        case .qa:
            return "https://websiteqas2019.miituo.com/"
        case .production:
            return "https://www.miituo.com/"
        }
    }
    
    public var pathPhotos: String {
        switch self {
        case .development:
            return "https://filesdev.miituo.com/"
        case .qa:
            return "https://filesqas.miituo.com/"
        case .production:
            return "https://files.miituo.com/"
        }
    }
    
}
