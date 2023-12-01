//
//  main.swift
//  SmartHomeSwift
//
//  Created by Ouahchia, Mohamed (JD) on 29/11/2023.
//

import Foundation

let home = SmartHome(network: randomString(length: 10), smartHomeID: randomString(length: 32))

print("Acceptable arguments: 'add room', 'remove room', 'add bulb', 'remove bulb' 'turn on room', 'turn off room', 'turn on device', 'turn off device', 'display rooms'")

var lookupTable: [String: String] = [String: String]()

func addRoom() {
    let UID = randomString(length: 32)
    print("Enter what you would like the room to be called: ")
    let str = readLine()
    if let input = str {
        if lookupTable[input] != nil {
            print("Name already exists.")
            return
        }
        home.addRoom(id: UID, args: ["friendlyName": input])
        lookupTable[input] = UID
    }
    else {
        print("Invalid input.")
    }
}

func addDevices() {
    print("Enter what you room you would like to add the device to: ")
    let str = readLine()
    if let input1 = str {
        
        if let roomID = lookupTable[input1] {
            if let room = home.rooms[roomID] {
                print("Enter what you would like the device to be called: ")
                let str1 = readLine()
                if let input2 = str1 {
                    if lookupTable[input2] != nil {
                        print("Name already exists.")
                        return
                    }
                }
            }
        }
        else {
            print("Room does not exist")
        }
        
    }
}

func inputRead() async {
    while (true) {
        do {
            try await Task.sleep(nanoseconds: UInt64(1 * Double(NSEC_PER_SEC)))
            let str = readLine()
            
        }
        catch {
            print("oops")
        }
    }
}

 await inputRead()
