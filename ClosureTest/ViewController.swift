//
//  ViewController.swift
//  ClosureTest
//
//  Created by iFlame. on 09/06/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)
        
        let customerProvider = {customersInLine.remove(at: 0)}
        print(customersInLine.count)
        
        print("Now serving \(customerProvider())!")
        print(customersInLine.count)
        
        
        networkCall { (value) -> (Float) in
            print("valueInt ==>> \(value)")
            return 1.0
        }
        
        var objStudent = Student(name: "Anil")
        print("Name 1 ==>> ", objStudent.name)
        testInOut(value: &objStudent)
        print("Name 2 ==>> ", objStudent.name)
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func networkCall(completionHandler : @escaping (Int)->(Float))->Void
    {
        print("Process Goes here")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            //Process Goes here
            let valueFloat = completionHandler(10)
            print("valueFloat ==>> \(valueFloat)")
        })
    }

    struct Student {
        var name : String
    }
    
    func testInOut( value : inout Student){
        //var value = value
        value.name = "Hello"
    }
}
