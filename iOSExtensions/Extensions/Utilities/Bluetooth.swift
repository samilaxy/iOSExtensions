//
//  Bluetooth.swift
//  AegisRiderCompanionApp
//
//  Created by Samuel Noye on 10/05/2022.
//

import Foundation
import CoreBluetooth

struct  BluetoothUtility {
    public static let serviceUUID = CBUUID(string: "6E400001-B5A3-F393-E0A9-E50E24DCCA9E")
    public static let writeCharId = CBUUID(string: "6E400002-B5A3-F393-E0A9-E50E24DCCA9")
    public static let readCharId =  CBUUID(string:"6E400003-B5A3-F393-E0A9-E50E24DCCA9E")
    public static let mySam = CBUUID(string: "2A2E2806-8497-4AEF-1DE2-78577A734A03")
}
