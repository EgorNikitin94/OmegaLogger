//
//  LogFormatter.swift
//  OmegaLogger
//
//  Created by Егор Никитин on 7/24/22.
//

import UIKit

public protocol LogFormatterInterface {
  var dateFormatter: DateFormatter {get set}
  func createLog<T>(_ message: T, type: LogType) -> Log?
  func format(log: Log) -> String?
}

public class LogFormatter: LogFormatterInterface {
  // MARK: - Properties
  private let showDate: Bool = true
  private let showFileName: Bool = true
  private let showLineNumder: Bool = true
  private let showColumnNumber: Bool = true
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
  
  public lazy var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS Z"
    return formatter
  }()
  
  // MARK: - Methods
  public func createLog<T>(_ message: T, type: LogType) -> Log? {
    return Log(message: String(describing: message),
               type: type,
               date: showDate ? Date() : nil,
               file: showFileName ? #file : nil,
               line: showLineNumder ? #line : nil,
               column: showColumnNumber ? #column : nil,
               function: showFunctionName ? #function : nil,
               color: logTypeColor(type))
  }
  
  public func format(log: Log) -> String? {
    var result = ""
    result += log.type.rawValue
    
    if let date = log.date,  showDate {
      result += " "
      result += "[\(dateFormatter.string(from: date))]"
    }
    
    if let fileName = log.file as? NSString, showFileName {
      result += " "
      result += "<\(fileName.lastPathComponent)>"
      if let lineNumber = log.line, showLineNumder {
        result += "{line: \(String(describing: lineNumber))"
        if let columnNumber = log.column, showColumnNumber {
          result += "\n column:\(String(describing: columnNumber))"
        }
        result += "}"
      }
    }
    
    if let functionName = log.function, showFunctionName {
      result += " "
      result += "+\(functionName)+"
    }
    
    result += log.message
    return result
  }
}
