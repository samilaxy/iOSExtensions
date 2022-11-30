
//
//  BleManager.swift
//  AegisRiderCompanionApp
//
//  Created by Abdul Suraj on 06/06/2022.
//

import Foundation
import CoreBluetooth


class BleManagerSingleton: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    
    // MARK: - Shared instance
    static let shared = BleManagerSingleton()
    private var centralManager: CBCentralManager!
    public var peripherals:[CBPeripheral] = []
    var connectedPeripheral: CBPeripheral!
    var writeCharacteristics: CBCharacteristic? = nil
    var readCharacteristics: CBCharacteristic? = nil
    var isConnected: Bool =  false
    var receivedData: [String] = []
    
    public override init() {
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: .main)
        self.centralManagerDidUpdateState(self.centralManager)
        print("ble.")
    }
    
    public func initializeBle() {
        //        self.centralManager = CBCentralManager(delegate: self, queue: .main)
        //        self.centralManagerDidUpdateState(self.centralManager)
        print("ble init...testing")
    }
    // // MARK: - central manager state changes
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch (central.state) {
            case .unsupported:
                print("BLE is Unsupported")
                break
            case .unauthorized:
                print("BLE is Unauthorized")
                break
            case .unknown:
                print("BLE is Unknown....")
                break
            case .resetting:
                print("BLE is Resetting")
                break
            case .poweredOff:
                print("BLE is Powered Off")
                break
            case .poweredOn:
                //print("Central scanning for", BLEConnection.bleServiceUUID);
                self.centralManager.scanForPeripherals(withServices:[JetSonService.service])
                break
            @unknown default:
                print("BLE is Unknown")
        }
    }
    
    // successfull discovery of available peripherals
    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        self.peripherals.append(peripheral)
        print(peripheral)
    }
    
    // function to start scanning
    public func startScan() {
        print("scanning in manager")
        self.centralManager.scanForPeripherals(withServices: [JetSonService.service])
    }
    
    // function to stop scanning
    public func stopScan() {
        self.centralManager.stopScan()
    }
    
    // function to connect to selected peripheral
    public func connect(peripheral: CBPeripheral) {
        print("connecting....in manger")
        self.centralManager.connect(peripheral, options: nil)
    }
    
    // function to disconnect from connected peripheral
    public func disconnect(peripheral: CBPeripheral) {
        print("disconnecting in manager start... \(peripheral)")
        self.centralManager.cancelPeripheralConnection(peripheral)
        print("disconnecting done... \(peripheral)")
    }
    
    //    // callback when peripheral connects succesfully
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("connected...")
        self.connectedPeripheral = peripheral
        connectedPeripheral.delegate = self
        peripheral.discoverServices([BluetoothUtility.serviceUUID]);
        self.isConnected = true
        let status = ["connected": true]
        NotificationCenter.default.post(name: Notification.Name("peripheralStatusConnected"), object: status, userInfo: status)
    }
    
    public func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        
        let status = ["connected": false]
        NotificationCenter.default.post(name: Notification.Name("peripheralStatusDisconnected"), object: status, userInfo: status)
    }
    
    // callback function when Services discovers
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        
        guard let services = peripheral.services else { return }
        
        for service in services {
            
            print(service)
            peripheral.discoverCharacteristics(nil, for: service)
            
        }
        
    } // END func peripheral(... didDiscoverServices
    
    
    // callback function when characteristics discovers
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else { return }
        
        
        for characteristic in characteristics {
            
            if characteristic.properties.contains(.read) {
                print("\(characteristic.uuid): properties contains .read")
                self.readCharacteristics = characteristic
            }
            if characteristic.properties.contains(.notify) {
                peripheral.setNotifyValue(true, for: characteristic)
                print("\(characteristic.uuid): properties contains .notify")
                self.readCharacteristics = characteristic
                
            }
            if characteristic.properties.contains(.write) {
                self.writeCharacteristics = characteristic
            }
        }
    } // eof function
    
    //  notification callback
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        print("notify char: ", characteristic)
        if error == nil {
            // error
        }
        guard let data = characteristic.value else { return }
        let message = String(decoding: data, as: UTF8.self)
        print("val", message)
     
    }
    //  read value updated callback
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        
        var characteristicASCIIValue = NSString()

          guard characteristic == readCharacteristics,

          let characteristicValue = characteristic.value,
          let ASCIIstring = NSString(data: characteristicValue, encoding: String.Encoding.utf8.rawValue) else { return }

          characteristicASCIIValue = ASCIIstring
          receivedData.append(characteristicASCIIValue as String)
          print("Value Recieved: \((characteristicASCIIValue as String))")
        
        
//        print("peri data", peripheral)
//        print("peri char", characteristic)
//        if error != nil {
//            // error
//            print(error)
//        } else {
//            print("value delegate", characteristic.value)
//            // get read value
//        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        if error != nil {
            // error
        } else {
            // write success
        }
    }
    
    //read value from jetson
    public func readValue() {
       
        guard self.readCharacteristics != nil, self.connectedPeripheral != nil else {
        return
        }
        self.connectedPeripheral.readValue(for: readCharacteristics!)
    }
    //notify
    public func notify(state: Bool) {
        guard self.readCharacteristics != nil, self.connectedPeripheral != nil else {
        return
        }
        print("not char")
        self.connectedPeripheral.setNotifyValue(state, for: self.readCharacteristics!)
    }
    //write value to jetson
    public func writeValue(value: String) {
        
        guard self.writeCharacteristics != nil, self.connectedPeripheral != nil else {
        return
        }
        print("winting value in char...")
        if let data = value.data(using: .utf8) {
            self.connectedPeripheral.writeValue(
                data,
                for: self.writeCharacteristics!,
                type: CBCharacteristicWriteType.withResponse
            )
        }
    }
}
