//
//  Error.swift
//  XHttp
//
//  Created by 徐荣 on 2022/10/17.
//

import Foundation

struct XError: Error {
    var desc = ""
    
    var localizedDescription: String {
        return desc
    }
    
    init(desc: String = "") {
        self.desc = desc
    }
}
