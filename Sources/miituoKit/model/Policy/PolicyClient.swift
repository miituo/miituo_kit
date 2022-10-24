//
//  File.swift
//  
//
//  Created by JOHN CRISTOBAL on 24/10/22.
//

import Foundation

public struct PolicyClientResponse: Codable {
    public var items: [PolicyClient]
}

// MARK: - PolicyClientElement
public struct PolicyClient: Codable {
    public var policies: Policies
    public var client: Client

    enum CodingKeys: String, CodingKey {
        case policies = "Policies"
        case client = "Client"
    }
}

// MARK: - Client
public struct Client: Codable {
    public var id: Int
    public var name, lastName, motherName, token: String
    public var email, nameContract, celphoneContract, cupon: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case lastName = "LastName"
        case motherName = "MotherName"
        case token = "Token"
        case email = "Email"
        case nameContract = "NameContract"
        case celphoneContract = "CelphoneContract"
        case cupon = "Cupon"
    }
}

// MARK: - Policies
public struct Policies: Codable {
    public var hasVehiclePictures, hasOdometerPicture, hasSiniester: Bool
    public var reportState, id: Int
    public var noPolicy, startDate, vigencyDate: String
    public var rate: Double
    public var lastOdometer, mensualidad: Int
    public var limitReportDate: String
    public var insuranceCarrier: InsuranceCarrier
    public var state, coverage: Coverage
    public var vehicle: Vehicle
    public var tickets: [Ticket]
    public var paymentType: String
    public var type: Int

    enum CodingKeys: String, CodingKey {
        case hasVehiclePictures = "HasVehiclePictures"
        case hasOdometerPicture = "HasOdometerPicture"
        case hasSiniester = "HasSiniester"
        case reportState = "ReportState"
        case id = "Id"
        case noPolicy = "NoPolicy"
        case startDate = "StartDate"
        case vigencyDate = "VigencyDate"
        case rate = "Rate"
        case lastOdometer = "LastOdometer"
        case mensualidad = "Mensualidad"
        case limitReportDate = "LimitReportDate"
        case insuranceCarrier = "InsuranceCarrier"
        case state = "State"
        case coverage = "Coverage"
        case vehicle = "Vehicle"
        case tickets = "Tickets"
        case paymentType = "PaymentType"
        case type = "Type"
    }
}

// MARK: - Coverage
public struct Coverage: Codable {
    public var id: Int
    public var coverageDescription: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case coverageDescription = "Description"
    }
}

// MARK: - InsuranceCarrier
public struct InsuranceCarrier: Codable {
    public var id: Int
    public var name: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
    }
}

// MARK: - Ticket
public struct Ticket: Codable {
    public var id, status, policyID: Int

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case status = "Status"
        case policyID = "PolicyId"
    }
}

// MARK: - Vehicle
public struct Vehicle: Codable {
    public var id: Int
    public var color, plates, capacity: String
    public var brand: Coverage
    public var model: ModelCar
    public var subtype, type, vehicleDescription: Coverage

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case color = "Color"
        case plates = "Plates"
        case capacity = "Capacity"
        case brand = "Brand"
        case model = "Model"
        case subtype = "Subtype"
        case type = "Type"
        case vehicleDescription = "Description"
    }
}

// MARK: - Model
public struct ModelCar: Codable {
    public var id, model: Int

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case model = "Model"
    }
}
