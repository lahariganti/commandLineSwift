//
//  main.swift
//  Panagram
//
//  Created by Lahari Ganti on 5/25/20.
//  Copyright © 2020 Lahari Ganti. All rights reserved.
//

import Foundation

let panagram = Panagram()
if CommandLine.argc < 2 {
  panagram.interactiveMode()
} else {
  panagram.staticMode()
}

