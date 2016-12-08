//
//  PreviousComputations.swift
//  memorizingcalculator
//  Created by Nehemiah Igbadumhe-Odior on 11/15/16.
//  Copyright © 2016 niidmogames. All rights reserved.
//

import Foundation

class PreviousComputations {
    
    var operation: String
    var a: Int
    var b: Int
    var ansewrSentance: String
    var answer: String
    
    init(operation:String,a:Int,b:Int,answer:String){
        self.operation = operation
        self.a = a
        self.b = b
        self.answer = answer
        self.ansewrSentance = "\(a) \(operation) \(b) = \(answer)"
    }
}
