# XHttp

[![Swift](https://img.shields.io/badge/Swift-5.0%2B-orange)](https://cocoapods.org/pods/XHttp)
[![License](https://img.shields.io/badge/License-MIT-lightgrey)](https://cocoapods.org/pods/XHttp)
[![Platform](https://img.shields.io/badge/Platforms-iOS-yellowgreen?style=flat-square)](https://cocoapods.org/pods/XHttp)

XHttp is an elegant and tiny network framework base on URLSession and Promises.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

PromisesSwift

## Installation

XHttp is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XHttp'
```

## Feature

- [x] Set base url
- [x] Set headers
- [x] Set timeout
- [x] Set query by String or Dictionary
- [x] Set http body

- [x] Chainable request
- [x] Convenience http method
- [x] Validate url
- [ ] Retry requset
- [ ] Cancel request
- [ ] Download

## Usage

You can create your network manager by inherit **XHttp**, config your base url, headers and timeout, etc.

```swift
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
```

And you can make requuset like this:

```swift
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
```

Finally, you can use like this:

```swift
import UIKit
import XHttp

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         post()
    }

    func get() {
        testGet(query: ["nickname": "Bob"]).then { res in
            print("jsonData:\n", res.jsonString)
        }.catch { err in
            print(err)
        }
    }
    
    func post() {
        testPost(query: ["age": 3, "hair": "black"], data: ["nickname": "Bob"]).then { res in
            print("jsonData:\n", res.jsonString)
        }.catch { err in
            print(err)
        }
    }

    func put() {
        testPut().then { res in
            print("jsonData:\n", res.jsonString)
        }.catch { err in
            print(err)
        }
    }
}
```

With Promises, you can combine request with ```all```:

```swift
import UIKit
import XHttp
import Promises

class ViewController: UIViewController {    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let get = testGet()
        let post = testPost(data: [:])
        all(get, post).then { res1, res2 in
            print(res1.jsonString)
            print(res2.jsonString)
        }
    }
}
```

## Author

xurong, xurong@xurong.tech

## License

XHttp is available under the MIT license. See the LICENSE file for more info.
