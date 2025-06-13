//
//  File.swift
//  
//
//  Created by JOHN CRISTOBAL on 24/10/22.
//

import Foundation

// MARK: - PolicyClientElement
public struct PolicyClient: Codable {
    public var policies: Policies
    public var client: Client

    enum CodingKeys: String, CodingKey {
        case policies = "Policies"
        case client = "Client"
    }

    public init(policies: Policies, client: Client) {
        self.policies = policies
        self.client = client
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

    public init(id: Int, name: String, lastName: String, motherName: String, token: String, email: String, nameContract: String, celphoneContract: String, cupon: String) {
        self.id = id
        self.name = name
        self.lastName = lastName
        self.motherName = motherName
        self.token = token
        self.email = email
        self.nameContract = nameContract
        self.celphoneContract = celphoneContract
        self.cupon = cupon
    }
}

// MARK: - Policies
public struct Policies: Codable {
    public var hasVehiclePictures, hasOdometerPicture, hasSiniester: Bool
    public var renew: Bool?
    public var reportState, id: Int
    public var noPolicy, startDate, vigencyDate: String
    public var rate: Double
    public var lastOdometer, mensualidad: Int
    public var limitReportDate: String
    public var insuranceCarrier: InsuranceCarrier
    public var state, coverage: Coverage
    public var vehicle: Vehicle
    public var tickets: [Ticket]?
    public var paymentType: String
    public var type: Int

    enum CodingKeys: String, CodingKey {
        case hasVehiclePictures = "HasVehiclePictures"
        case hasOdometerPicture = "HasOdometerPicture"
        case renew = "Renew"
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

    public init(hasVehiclePictures: Bool, hasOdometerPicture: Bool, hasSiniester: Bool, renew:Bool,reportState: Int, id: Int, noPolicy: String, startDate: String, vigencyDate: String, rate: Double, lastOdometer: Int, mensualidad: Int, limitReportDate: String, insuranceCarrier: InsuranceCarrier, state: Coverage, coverage: Coverage, vehicle: Vehicle, tickets: [Ticket], paymentType: String, type: Int) {
       
        self.hasVehiclePictures = hasVehiclePictures
        self.hasOdometerPicture = hasOdometerPicture
        self.renew = renew
        self.hasSiniester = hasSiniester
        self.reportState = reportState
        self.id = id
        self.noPolicy = noPolicy
        self.startDate = startDate
        self.vigencyDate = vigencyDate
        self.rate = rate
        self.lastOdometer = lastOdometer
        self.mensualidad = mensualidad
        self.limitReportDate = limitReportDate
        self.insuranceCarrier = insuranceCarrier
        self.state = state
        self.coverage = coverage
        self.vehicle = vehicle
        self.tickets = tickets
        self.paymentType = paymentType
        self.type = type
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

    public init(id: Int, coverageDescription: String) {
        self.id = id
        self.coverageDescription = coverageDescription
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

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
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

    public init(id: Int, status: Int, policyID: Int) {
        self.id = id
        self.status = status
        self.policyID = policyID
    }
}

// MARK: - Vehicle
public struct Vehicle: Codable {
    public var id: Int
    public var color, plates, capacity: String
    public var brand: Coverage
    public var model: Model
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

    public init(id: Int, color: String, plates: String, capacity: String, brand: Coverage, model: Model, subtype: Coverage, type: Coverage, vehicleDescription: Coverage) {
        self.id = id
        self.color = color
        self.plates = plates
        self.capacity = capacity
        self.brand = brand
        self.model = model
        self.subtype = subtype
        self.type = type
        self.vehicleDescription = vehicleDescription
    }
}

// MARK: - Model
public struct Model: Codable {
    public var id, model: Int

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case model = "Model"
    }

    public init(id: Int, model: Int) {
        self.id = id
        self.model = model
    }
}

