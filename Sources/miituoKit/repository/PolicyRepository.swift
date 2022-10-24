//
//  File.swift
//  
//
//  Created by JOHN CRISTOBAL on 24/10/22.
//

import Foundation

public struct PolicyRepository {
    
    public var baseUrl: String

    public init(baseUrl: String){
        self.baseUrl = baseUrl
    }
    
    public func getPolicies(phone: String, completion: @escaping([PolicyClient]?, AppError?) -> Void){
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 120
        sessionConfig.timeoutIntervalForResource = 120
        let session = URLSession(configuration: sessionConfig)
        
        let urlString = "\(self.baseUrl)InfoClientMobil/Celphone/\(phone)"
        var request = URLRequest(url: URL(string: urlString)!, cachePolicy: .returnCacheDataElseLoad)
        request.httpMethod = "GET"
        
        session.dataTask(with: request) { data, response, errorData in
            
            if let error = errorData {
                completion(nil, AppError(message: error.localizedDescription))
            } else if let data = data {
                do {
                    if let httpresponse = response as? HTTPURLResponse, httpresponse.statusCode != 200 {
                        let resp = try JSONDecoder().decode(MessageResponse.self, from: data)
                        completion(nil, AppError(message: resp.message))
                    } else {
                        let resp = try JSONDecoder().decode([PolicyClient].self, from: data)
                        completion(resp, nil)
                    }
                } catch {
                    print(error)
                    completion(nil, AppError(message: "Tuvimos un problema, intente más tarde."))                }
            } else {
                completion(nil, AppError(message: "Tuvimos un problema, intente más tarde."))
            }
        }.resume()
    }
}
