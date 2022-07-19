//
//  LogManager.swift
//  OmegaLogger
//
//  Created by Егор Никитин on 7/16/22.
//

import Foundation

typealias OmgLog = LogManager

public protocol LoggerInterface {
  func info(_ data: Any)
  func debug(_ data: Any)
  func stackTrace(_ data: Any)
  func error(_ data: Any)
}

final public class LogManager: NSObject, LoggerInterface {
  
  public func info(_ data: Any) {
    print(data)
  }
  
  public func debug(_ data: Any) {
    print(data)
  }
  
  public func stackTrace(_ data: Any) {
    print(data)
  }
  
  public func error(_ data: Any) {
    print(data)
  }
  
}
