//
//  Extensions.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data =  try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
