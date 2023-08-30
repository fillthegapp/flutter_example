//
//  Channel.swift
//  Runner
//
//  Created by Alejandro Fernandez Ruiz on 30/8/23.
//

import Foundation
import Flutter
import AmplitudeSwift

protocol Channel {
  var channel: FlutterMethodChannel? { get }
  var controller: FlutterViewController? { get set }
  var channelName: String { get }
  func initChannel()
}
