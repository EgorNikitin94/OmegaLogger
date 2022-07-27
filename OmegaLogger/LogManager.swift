//
//  LogManager.swift
//  OmegaLogger
//
//  Created by Егор Никитин on 7/16/22.
//

import Foundation

public typealias OmgLog = LogManager

public protocol LoggerInterface {
  static func info<T>(_ data: T, date: Date, file: String, line: Int, column: Int, function: String)
  static func debug<T>(_ data: T)
  static func trace<T>(_ data: T)
  static func error<T>(_ data: T)
}

final public class LogManager: LoggerInterface {
  
  // MARK: - shared instance
  private static let shared: LogManager = LogManager()
  
  // MARK: - Properties
  public var logFormatter: LogFormatterInterface = LogFormatter()
  public var logHandlers: Array<LogHandlerInterface> = [ConsoleHandler()]
  
  // MARK: - LoggerInterface static methods
  public static func info<T>(_ data: T, date: Date = Date(), file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) {
    shared.formatLog(data, type: .info, date: date, file: file, line: line, column: column, function: function)
  }
  
  public static func debug<T>(_ data: T) {
    //shared.formatLog(data, type: .debug)
  }
  
  public static func trace<T>(_ data: T) {
    //shared.formatLog(data, type: .trace)
  }
  
  public static func error<T>(_ data: T) {
    //shared.formatLog(data, type: .error)
  }
  
  private func formatLog<T>(_ data: T, type: LogType, date: Date, file: String, line: Int, column: Int, function: String) {
    let log = Log(message: String(describing: data), type: type, date: date, file: file, line: line, column: column, function: function, color: .white)
//    logFormatter.createLog(data, type: type)
//    guard let log = log else {
//      return
//    }
    let fullMessage = logFormatter.format(log: log)
    handleLog(fullMessage)
  }
  
  private func handleLog(_ message: String?) {
    guard let message = message else {return}
    logHandlers.forEach { handler in
      handler.write(message)
    }
  }
  
}
