//
//  ButtonSeqsDatabase.swift
//  MDTester
//
//  Created by Irene Hwang on 8/5/15.
//  Copyright (c) 2015 Irene Hwang. All rights reserved.
//

import Foundation

 class ButtonSeqsDatabase {
    
    var database: [[Int]] = []
    
    func checkValidity(seq: [Int]) -> Bool
    {
        for estSeq in database
        {
            if (seq == estSeq)
            {
                return false
            }
        }
        return true
    }
}
