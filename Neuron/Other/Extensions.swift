//
//  Extensions.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import Foundation
import SwiftUI

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
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

extension Decodable {
    static func fromDictionary(_ dictionary: [String: Any]) -> Self? {
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary)
            let object = try JSONDecoder().decode(Self.self, from: data)
            return object
        } catch {
            print("Error decoding JSON into \(Self.self): \(error.localizedDescription)")
            return nil
        }
    }
}
