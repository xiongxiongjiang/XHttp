//
//  Respone.swift
//  XHttp
//
//  Created by 徐荣 on 2022/10/14.
//

import Foundation

open class XHttpRespone {
    public var data: [String: Any] = [:]
    public var jsonString: String = ""
    public var status: Int?
    public var headers: [AnyHashable: Any]?
}
