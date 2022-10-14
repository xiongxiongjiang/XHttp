//
//  ViewController.swift
//  XHttp
//
//  Created by 16330990 on 10/14/2022.
//  Copyright (c) 2022 16330990. All rights reserved.
//

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

