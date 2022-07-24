//
//  LogFormatter.swift
//  OmegaLogger
//
//  Created by Егор Никитин on 7/24/22.
//

import UIKit

public protocol LogFormatterInterface {
  func createLog<T>(_ message: T, type: LogType) -> Log?
}

public class LogFormatter: LogFormatterInterface {
  // MARK: - Properties
  private let showDate: Bool = true
  private let showFileName: Bool = true
  private let showLineNumder: Bool = true
  private let showColumnNumder: Bool = true
  private let showFunctionName: Bool = true
  private lazy var logTypeColor: ((LogType) -> UIColor) = { type in
    switch (type) {
    case .info:
      return .blue
    case .debug:
      return .green
    case .trace:
      return .purple
    case .error:
      return .red
    }
  }
  
  // MARK: - Methods
  public func createLog<T>(_ message: T, type: LogType) -> Log? {
    return Log(message: String(describing: message),
               type: type,
               date: showDate ? Date() : nil,
               file: showFileName ? #file : nil,
               line: showLineNumder ? #line : nil,
               column: showColumnNumder ? #column : nil,
               function: showFunctionName ? #function : nil,
               color: logTypeColor(type))
  }
}
