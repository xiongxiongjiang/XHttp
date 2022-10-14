//
//  Test.swift
//  XHttp
//
//  Created by 徐荣 on 2022/9/20.
//

import Foundation
import Promises
import XHttp

func testGet(query: [String: Any]? = nil) -> Promise<XHttpRespone> {
    return http.request("/get", query: query)
}

func testPost(query: [String: Any]? = nil, data: [String: Any]?) -> Promise<XHttpRespone> {
    return http.request("/post", method: .post, data: data, query: query)
}

func testPut() -> Promise<XHttpRespone> {
    return http.request("/put", method: .put)
}
