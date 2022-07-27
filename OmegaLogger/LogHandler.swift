//
//  LogHandler.swift
//  OmegaLogger
//
//  Created by Егор Никитин on 7/24/22.
//

import Foundation

public protocol LogHandlerInterface {
  func write(_ log: String)
}

public class ConsoleHandler: LogHandlerInterface {
  public func write(_ log: String) {
    print(log)
  }
}
