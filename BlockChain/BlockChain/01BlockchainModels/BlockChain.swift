//
//  BlockChain.swift
//  BlockChain
//
//  Created by Piyush Sharma on 30/08/19.
//  Copyright © 2019 Piyush Sharma. All rights reserved.
//

import Foundation

class BlockChain {
    
    private (set) var blocks : [Block] = [Block]()
    
    //Initial block when there in new transaction or blockchain is initialized
    
    init(block: Block)
    {
        addBlock(block: block)
    }
    
    func addBlock( block : Block)
    {
        
        //If block is empty
        
        if self.blocks.isEmpty
        {
            block.previousHash = "0000000000000000"
            block.hash = generateHash(for: block)
        }
        
        self.blocks.append(block)
        
    }
    
    
    func getNextBlock(transactions :[Transaction]) -> Block {
        
        let block = Block()
        transactions.forEach { transaction in
            block.addTransaction(transaction: transaction)
        }
        
        let previousBlock = getPreviousBlock()
        block.index = self.blocks.count
        block.previousHash = previousBlock.hash
        block.hash = generateHash(for: block)
        return block
        
    }
    
    private func getPreviousBlock() -> Block {
        return self.blocks[self.blocks.count - 1]
    }
    
    func generateHash(for block :Block) -> String {
        
        var hash = block.key.sha1Hash()
        
        while(!hash.hasPrefix("00")) {
            block.nonce += 1
            hash = block.key.sha1Hash()
            print(hash)
        }
        
        return hash
    }
}

extension String
{
    /*
     Method to create hash
     */
    func sha1Hash() -> String
    {
        
        let task = Process()
        task.launchPath = "/usr/bin/shasum"
        task.arguments = []
        
        let inputPipe = Pipe()
        inputPipe.fileHandleForWriting.write(self.data(using: String.Encoding.utf8)!)
        inputPipe.fileHandleForWriting.closeFile()
        
        let outputPipe = Pipe()
        task.standardOutput = outputPipe
        task.standardInput = inputPipe
        task.launch()
        
        let data = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let hash = String(data: data, encoding: String.Encoding.utf8)
        
        return (hash?.replacingOccurrences(of: "  -\n", with: ""))!
    }
    
}
