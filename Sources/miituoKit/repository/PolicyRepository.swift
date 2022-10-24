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
    
    public func getPolicies(telefono:String, completion: @escaping(PolicyClient?, AppError?) -> Void){
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 120
        sessionConfig.timeoutIntervalForResource = 120
        let session = URLSession(configuration: sessionConfig)
        
        let urlString = "\(self.baseUrl)InfoClientMobil/Celphone/"
        var request = URLRequest(url: URL(string: urlString)!, cachePolicy: .returnCacheDataElseLoad)
        request.httpMethod = "GET"
        
        session.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                if let error = error {
                    print("return error")
                    print(error)
                    completion(nil, AppError(message: error.localizedDescription))
                } else if let data = data {
                    do {
                        
                        let resp = try JSONDecoder().decode(PolicyClient.self, from: data)
                        completion(resp, nil)

                    } catch {
                        print(" fatal error convert")
                        completion(nil, AppError(message: "Error al convertir respuesta"))
                    }
                } else {
                    print(" fatal error ")
                    completion(nil, AppError(message: "Tuvimos un problema, intente más tarde."))
                }
            }
            
        }.resume()
    }
    
}
