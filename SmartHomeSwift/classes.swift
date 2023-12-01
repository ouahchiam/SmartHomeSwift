//
//  classes.swift
//  SmartHomeSwift
//
//  Created by Ouahchia, Mohamed (JD) on 29/11/2023.
//

import Foundation

enum ErrorState {
    case success
    case invalidOption
}

enum DeviceState {
    case on
    case off
    case updating
    case disabled
}

class Device {
    private var state: DeviceState
    func toggleState() -> ErrorState{
        switch (state) {
        case DeviceState.on:
            state = DeviceState.off
        case DeviceState.off:
            state = DeviceState.on
        default:
            return ErrorState.invalidOption
        }
        return ErrorState.success
    }
    
    func setDeviceState(desiredState: DeviceState) {
        state = desiredState
    }
    
    init(state: DeviceState) {
        self.state = state
    }
}

class SmartHome {
    private var network: String
    private var smartHomeID: String
    var rooms = [String: Room]()
    init(network: String, smartHomeID: String) {
        self.network = network
        self.smartHomeID = smartHomeID
    }
    func addRoom(id: String, args: [String: String]) {
        rooms[id] = Room(friendlyName: args["friendlyName"]!)
    }
    func removeRoom(id: String) {
        rooms[id] = nil
    }
}

class Room {
    private var devices = [Device]()
    private var friendlyName: String
    func toggleMasterSwitch() {
        for device in devices {
            let result = device.toggleState()
            if result == ErrorState.invalidOption {
                print("Invalid option.")
            }
        }
    }
    func addDevice(device: Device) -> ErrorState {
        devices.append(device)
        return ErrorState.success
    }
    init(friendlyName: String) {
        self.friendlyName = friendlyName
    }
}

class SmartBulb: Device {
    var color = "#ffffff"
    private var brightness = 100 // descending, 100 to 0
    func decreaseBrightness() {
        if brightness > 0 {
            brightness -= 10
        }
    }
    func increaseBrightness() {
        if brightness < 100 {
            brightness += 10
        }
    }
}

