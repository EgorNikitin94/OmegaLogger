//
//  LogHandler.swift
//  OmegaLogger
//
//  Created by Егор Никитин on 7/24/22.
//

import Foundation

enum HandlerType {
  case condsole
  case file
}

protocol LogHandlerInterface {
  func write(_ log: Log)
}
