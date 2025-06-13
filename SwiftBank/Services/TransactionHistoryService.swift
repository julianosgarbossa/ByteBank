//
//  TransactionHistoryService.swift
//  SwiftBank
//
//  Created by Juliano Sgarbossa on 13/06/25.
//

import Foundation

class TransactionHistoryService {
    var transactions: [String] = []
    
    func addTransaction(message: String) {
        transactions.insert(message, at: 0)
    }
}
