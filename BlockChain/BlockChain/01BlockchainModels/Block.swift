//
//  Block.swift
//  BlockChain
//
//  Created by Piyush Sharma on 30/08/19.
//  Copyright © 2019 Piyush Sharma. All rights reserved.
//

import Foundation

class Block{
    
    var index : Int = 0
    var previousHash : String = ""
    var hash : String!
    var nonce : Int
    
    private (set) var transactions : [Transaction] = [Transaction]()
    
    var key : String {
        get{
            let transactionData = try! JSONEncoder().encode(self.transactions)
            let transactionString = String(data: transactionData, encoding: .utf8)
            return String(self.index) + self.previousHash + String(self.nonce) + transactionString!
        }
    }
    
    init() {
        self.nonce = 0
    }
    
    func addTransaction(transaction : Transaction)
    {
        transactions.append(transaction)
    }
}
