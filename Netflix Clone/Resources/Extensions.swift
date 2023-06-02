//
//  Extensions.swift
//  Netflix Clone
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 02/06/2023.
//

import Foundation


extension String {
    func capitalizeFirstLetters() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
