//
//  Config.swift
//  Pods
//
//  Created by 徐荣 on 2022/10/14.
//

import Foundation

open class XHttpConfig {
    public var baseURL: String = ""
    public var headers: [String: String] = [:]
    public var timeout: TimeInterval = 100
    
    public init() {

    }
}
