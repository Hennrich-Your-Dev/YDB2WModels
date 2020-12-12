//
//  YDStore.swift
//  YDB2WModels
//
//  Created by Douglas Hennrich on 08/12/20.
//

import Foundation

public class YDStores: Decodable {
  public let stores: [YDStore]
}

public class YDStore: Decodable {

  // MARK: Properties
  public let id: String
  public let name: String
  public let sellerID: String
  public let sellerStoreID: String

  public let distance: Double
  public let address: YDAddress?
  public let geolocation: YDStoreGeolocation?

  // MARK: Computed variables
  public var formatAddress: String {
    guard let address = self.address
      else { return "" }

    return address.formatAddress
  }

  public var isLasa: Bool {
    // Convert KM to Meters
    let currentDistance = Measurement(value: distance, unit: UnitLength.kilometers)
    let meters = currentDistance.converted(to: .meters)
    return meters.value <= 400
  }

  public var formatDistance: String {
    let kilometers = Measurement(value: distance, unit: UnitLength.kilometers)
    let meters = kilometers.converted(to: .meters)
    return meters.value >= 1000 ? "\(kilometers.value) \(kilometers.unit.symbol)" : "\(meters.value) \(meters.unit.symbol)"
  }

  public func addressAndStoreName() -> String {
    guard let unwarpAddress = self.address,
      var address = unwarpAddress.address
      else { return "" }

    let name = self.name

    if let number = unwarpAddress.number,
      !number.isEmpty {
      address += ", " + number
    }

    return [address, name].filter { !($0).isEmpty }.joined(separator: " : ")
  }

  // MARK: CodingKeys
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case sellerID = "sellerId"
    case sellerStoreID = "sellerStoreId"
    case distance
    case address
    case geolocation
  }
}

// MARK: Geolocation
public class YDStoreGeolocation: Decodable {
  public let latitude, longitude: Double?
}
