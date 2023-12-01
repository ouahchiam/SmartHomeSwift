//
//  utility.swift
//  SmartHomeSwift
//
//  Created by Ouahchia, Mohamed (JD) on 01/12/2023.
//

import Foundation

func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}
