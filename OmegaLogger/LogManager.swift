//
//  LogManager.swift
//  OmegaLogger
//
//  Created by Егор Никитин on 7/16/22.
//

import Foundation

public typealias OmgLog = LogManager

public protocol LoggerInterface {
  func info<T>(_ data: T)
  func debug<T>(_ data: T)
  func trace<T>(_ data: T)
  func error<T>(_ data: T)
}

final public class LogManager: NSObject, LoggerInterface {
  
  public func info<T>(_ data: T) {
    print(data)
  }
  
  public func debug<T>(_ data: T) {
    print(data)
  }
  
  public func trace<T>(_ data: T) {
    print(data)
  }
  
  public func error<T>(_ data: T) {
    print(data)
  }
  
}
