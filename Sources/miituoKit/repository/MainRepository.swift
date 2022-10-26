//
//  File.swift
//  
//
//  Created by JOHN CRISTOBAL on 24/10/22.
//

import Foundation

public protocol TokenClient{
    var token: String { get }
}

public struct MainRepository: TokenClient {
    public var token: String
    public var policyRepo: PolicyRepository
    public var authRepo: AuthRepository

    public var environment: Environment
    
    public init(environment: Environment) {
        self.environment = environment
       
        policyRepo = PolicyRepository(baseUrl: environment.url)
        authRepo = AuthRepository(baseUrl: environment.url)
        
        self.token = ""
    }
    
    public mutating func updateToken(_ token: String){
        self.token = token
        self.authRepo.token = token
    }
}
