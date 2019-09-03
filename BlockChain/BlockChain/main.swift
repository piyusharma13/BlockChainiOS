//
//  main.swift
//  BlockChain
//
//  Created by Piyush Sharma on 25/08/19.
//  Copyright © 2019 Piyush Sharma. All rights reserved.
//

import Foundation

print("Hello, World!")

let initialBlock = Block()

let blockchain = BlockChain(block: initialBlock)

let transaction = Transaction(from: "Piyush", to: "Varun", amount: "20")


print("-------------------------")
let block = blockchain.getNextBlock(transactions: [transaction])
blockchain.addBlock(block:)
print(blockchain.blocks.count)

