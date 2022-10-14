//
//  Dictionary+XHttp.swift
//  XHttp
//
//  Created by 徐荣 on 2022/10/14.
//

import Foundation

public extension Dictionary {
    
    /// Dictionary to query string
    var queryString: String {
        map { "\($0)=\($1)" }.joined(separator: "&")
    }
}

// prettyPrinted 指定输出使用空格和缩进使结果数据更具可读性。
// sortedKeys 指定输出按字典顺序对键进行排序。
// fragmentsAllowed 指定解析器应该允许不是数组或字典的顶级对象。
// withoutEscapingSlashes iOS 13 指定输出不使用转义字符作为斜线字符的前缀。
public extension Dictionary {
    
    /// Dictionary to json string
    var jsonString: String {
        if (!JSONSerialization.isValidJSONObject(self)) {
            print("Unable to parse JSONString!")
            return ""
        }
        var opt: JSONSerialization.WritingOptions = [.prettyPrinted]
        if #available(iOS 11.0, *) {
            opt.update(with: .sortedKeys)
            opt.update(with: .fragmentsAllowed)
        }
        if #available(iOS 13.0, *) {
            opt.update(with: .withoutEscapingSlashes)
        }
        let data = try? JSONSerialization.data(withJSONObject: self, options: opt)
        let str = String(data: data!, encoding: .utf8)
        return str ?? ""
    }
}
