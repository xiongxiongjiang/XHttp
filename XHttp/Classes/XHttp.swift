//
//  XHttp.swift
//  Pods
//
//  Created by 徐荣 on 2022/10/14.
//

import Foundation
import Promises

open class XHttp {
    
    public var config: XHttpConfig = XHttpConfig()
    
    public init() {

    }
    
    public func request(_ path: String,
                        method: HttpMethod = .get,
                        data: [String: Any]? = [:],
                        query: Any? = nil
    ) -> Promise<XHttpRespone> {
        let urlString = makeUrl(path: path, config: self.config, query: query)
        return Promise { fulfill, reject in
            guard let url = URL(string: "\(urlString)") else {
                let error = XError(desc: "Invalid URL: \(urlString)")
                reject(error)
                return
            }
            var req = URLRequest.init(url: url)
            req.allHTTPHeaderFields = self.config.headers
            req.httpMethod = method.rawValue
            req.timeoutInterval = self.config.timeout
            let task = URLSession.shared.dataTask(with: req) { data, response, error in
                guard error == nil, let jsonData = data else {
                    reject(error!)
                    return
                }
                var statusCode: Int?
                var headers: [AnyHashable: Any]?
                if let response = response as? HTTPURLResponse {
                    statusCode = response.statusCode
                    headers = response.allHeaderFields
                }
                let dict = jsonData.dictionary
                let json = dict.jsonString
                let xRespone = XHttpRespone()
                xRespone.data = dict
                xRespone.jsonString = json
                xRespone.status = statusCode
                xRespone.headers = headers
                fulfill(xRespone)
            }
            task.resume()
        }
    }
    
    private func makeUrl(path: String, config: XHttpConfig, query: Any?) -> String {
        let q = getQuery(query: query)
        return "\(config.baseURL)\(path)\(q)"
    }

    private func getQuery(query: Any?) -> String {
        if let query = query as? Dictionary<String, Any> {
            return "?\(query.queryString)"
        }
        if let query = query as? String {
            return query
        }
        return ""
    }
}
