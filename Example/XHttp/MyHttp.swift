//
//  MyHttp.swift
//  XHttp
//
//  Created by 徐荣 on 2022/9/20.
//

import Foundation
import XHttp

let http = MyHttp.shared

class MyHttp: XHttp {

    static let shared: MyHttp = {
        let myConfig = XHttpConfig()
        myConfig.baseURL = "https://httpbin.org"
        myConfig.headers = ["token": "xxx"]
        let instance = MyHttp()
        instance.config = myConfig
        return instance
    }()
    
    private override init() {
        super.init()
    }
}
