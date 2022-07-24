//
//  LogManager.swift
//  OmegaLogger
//
//  Created by Егор Никитин on 7/16/22.
//

import Foundation

public typealias OmgLog = LoggerInterface

public protocol LoggerInterface {
  static func info<T>(_ data: T)
  static func debug<T>(_ data: T)
  static func trace<T>(_ data: T)
  static func error<T>(_ data: T)
}

final public class LogManager: LoggerInterface {
  
  // MARK: - shared instance
  private static let shared: LoggerInterface = LogManager()
  
  // MARK: - Properties
  
  // MARK: - LoggerInterface static methods
  public static func info<T>(_ data: T) {
    print(data)
  }
  
  public static func debug<T>(_ data: T) {
    print(data)
  }
  
  public static func trace<T>(_ data: T) {
    print(data)
  }
  
  public static func error<T>(_ data: T) {
    print(data)
  }
  
}
