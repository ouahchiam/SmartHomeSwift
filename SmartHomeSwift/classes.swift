//
//  classes.swift
//  SmartHomeSwift
//
//  Created by Ouahchia, Mohamed (JD) on 29/11/2023.
//

import Foundation

enum ErrorState {
    case successful
    case unsuccessful
}

class Device {
    private var state: Bool = true // true is on, false is off
    func toggleState() {
        state = !state
    }
}

class SmartHome {
    private var network: String
    private var smartHomeID: String
    private var rooms = [String: Room]()
    init(network: String, smartHomeID: String) {
        self.network = network
        self.smartHomeID = smartHomeID
    }
    func addRoom(id: String, room: Room) {
        rooms[id] = room
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
            device.toggleState()
        }
    }
    func addDevice(device: Device) -> ErrorState {
        devices.append(device)
        return ErrorState.successful
    }
    init(friendlyName: String) {
        self.friendlyName = friendlyName
    }
}

class Camera: Device {
    
}

