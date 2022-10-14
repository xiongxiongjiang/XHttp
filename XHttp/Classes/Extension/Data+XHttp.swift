//
//  Data+XHttp.swift
//  XHttp
//
//  Created by 徐荣 on 2022/10/14.
//

import Foundation

public extension Data {
    // mutableContainer 允许将数据解析成json对象后，修改其中的数据

    // mutableLeaves 使解析出来的json对象的叶子节点的属性变为NSMutableString

    // fragmentsAllowed 允许所有 JSON 所有的类型，作为 JSON 的最外层。
    // NSJSONReadingAssumeTopLevelDictionary and NSJSONReadingAllowFragments cannot be set at the same time

    // json5Allowed(iOS 15.0):
    // 单引号或双引号字符串。
    // 跨越多行的字符串。
    // 单行和多行注释，使用//和/* … */语法。
    // 增强的数字格式支持，包括十六进制、前导或尾随小数点、显式加号和 IEEE 754 正无穷大、负无穷大和.NaN

    // topLevelDictionaryAssumed(iOS 15.0):
    // 这是对 JSON5 的扩展，不是规范的一部分。使用此选项以及支持在使用多个自定义属性的 Markdown 字符串中使用 JSON5。

    // allowFragments 允许被解析的json数据不是array或者dic包裹，可以是单个string值 deprecated -> fragmentsAllowed
    var dictionary: Dictionary<String, Any> {
        var opt: JSONSerialization.ReadingOptions = [
            .mutableContainers,
            .fragmentsAllowed,
        ]
        if #available(iOS 15.0, *) {
            opt.update(with: .json5Allowed)
        }
        do {
            let json = try JSONSerialization.jsonObject(with: self, options: opt)
            let dic = json as? Dictionary<String, Any> ?? [:]
            return dic
        } catch {
            debugPrint(error)
            return [:]
        }
    }
}
