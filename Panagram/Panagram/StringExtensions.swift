//
//  StringExtensions.swift
//  Panagram
//
//  Created by Lahari Ganti on 5/25/20.
//  Copyright © 2020 Lahari Ganti. All rights reserved.
//

import Foundation

extension String {
  func isAnagram(_ string: String) -> Bool {
    let lowercasedSelf = self.lowercased().replacingOccurrences(of: " ", with: "")
    let lowercaseOther = string.lowercased().replacingOccurrences(of: " ", with: "")
    
    return lowercasedSelf.sorted() == lowercaseOther.sorted()
  }
  
  func isPalindrome() -> Bool {
    return self.lowercased().replacingOccurrences(of: " ", with: "") == String(self.lowercased().replacingOccurrences(of: " ", with: "").reversed())
  }
}
