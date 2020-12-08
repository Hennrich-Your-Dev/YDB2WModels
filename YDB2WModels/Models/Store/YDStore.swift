//
//  YDStore.swift
//  YDB2WModels
//
//  Created by Douglas Hennrich on 08/12/20.
//

import Foundation

public class YDStores: Decodable {
  let stores: [YDStore]
}

public class YDStore: Decodable {

  // MARK: Properties
  public let id: String
  public let name: String
  public let sellerID: String
  public let sellerStoreID: String

  let distance: Double
  let address: YDStoreAddress?
  let geolocation: YDStoreGeolocation?

  // MARK: Computed variables
  public var formatAddress: String {
    guard let address = self.address,
      let addressString = address.address
      else { return "" }

    var format: String = addressString

    if let number = address.number,
      !number.isEmpty {
      format += ", \(number)"
    }

    if let city = address.city,
      !city.isEmpty {
      format += " - \(city)"
    }

    return format
  }

  public var isLasa: Bool {
    // Convert KM to Meters
    return (distance * 1000) <= 400
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

// MARK: Address
public struct YDStoreAddress: Decodable {
  let zipCode: String?
  let reference: String?
  let number: String?
  let address: String?
  let neighborhood: String?
  let city: String?
  let state: String?
}

// MARK: Geolocation
public class YDStoreGeolocation: Decodable {
  let latitude, longitude: Double?
}
