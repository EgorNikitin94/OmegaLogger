//
//  Log.swift
//  OmegaLogger
//
//  Created by Егор Никитин on 7/20/22.
//

import Foundation

enum LogType: String {
  case info = "info"
  case debug = "Debug"
  case stackTrace = "Stack Trace"
  case error = "Error"
}

public class Log {
  
  var type: LogType
  
  init(type: LogType) {
    self.type = type
  }
  
}
