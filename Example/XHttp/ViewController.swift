//
//  ViewController.swift
//  XHttp
//
//  Created by xurong on 10/14/2022.
//  Copyright (c) 2022 xurong. All rights reserved.
//

import UIKit
import XHttp

class ViewController: UIViewController {
    
    lazy var lable: UILabel = {
        let lab = UILabel()
        let size = UIScreen.main.bounds.size
        lab.frame = CGRect(x: 20, y: 88, width: size.width - 40, height: 500)
        lab.numberOfLines = 0
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1)
        return lab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(lable)
        
        get()
    }

    func get() {
        testGet(query: ["nickname": "Bob"]).then { res in
            print("jsonData:\n", res.jsonString)
            self.lable.text = res.jsonString
        }.catch { err in
            print(err)
        }
    }
    
    func post() {
        testPost(query: ["age": 3, "hair": "black"], data: ["nickname": "Bob"]).then { res in
            print("jsonData:\n", res.jsonString)
            self.lable.text = res.jsonString
        }.catch { err in
            print(err)
        }
    }

    func put() {
        testPut().then { res in
            print("jsonData:\n", res.jsonString)
            self.lable.text = res.jsonString
        }.catch { err in
            print(err)
        }
    }

}

