//
//  Transactions.swift
//  BlockChain
//
//  Created by Piyush Sharma on 30/08/19.
//  Copyright © 2019 Piyush Sharma. All rights reserved.
//

import Foundation

//An event to transfer amount from one address to another
class Transaction : Codable{
    
    var from : String
    var to : String
    var amount : String
    
    init(from : String, to : String, amount : String)
    {
        self.from = from
        self.to = to
        self.amount = amount
    }
    
}
