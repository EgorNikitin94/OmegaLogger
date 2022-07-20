//
//  Log.swift
//  OmegaLogger
//
//  Created by Егор Никитин on 7/20/22.
//

import Foundation

public enum LogType: String {
  case info = "Info"
  case debug = "Debug"
  case trace = "Trace"
  case error = "Error"
}

public struct Log {
  public let message: String
  public let type: LogType
  public let date: Date?
  public let file: String?
  public let line: Int?
  public let column: Int?
  public let function: String?
  public let color: String?
}
