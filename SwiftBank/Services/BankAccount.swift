//
//  BankAccount.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 15/03/24.
//

import Foundation

enum BankOperation {
    case withdraw, deposit
}

protocol BankingServiceDelegate: AnyObject {
    func didPerformOperation()
}

protocol AccountServices {
    func performOperation(operation: BankOperation, amount: Double) -> Bool
    func requestLoan(amount: Double)
    func calculateInterestRate()
}

class BankAccount: AccountServices {
    
    var balance: Double = 0.0
    var accountNumber: String
    
    private var notificationService = NotificationService()
    var transactionsHistoryService = TransactionHistoryService()
    
    init(accountNumber: String) {
        self.accountNumber = accountNumber
    }
    
    func performOperation(operation: BankOperation, amount: Double) -> Bool {
        switch operation {
        case .withdraw:
            if amount <= balance {
                balance -= amount
                notificationService.sendNotification(message: "Saque no valor de \(amount.formatCurrency()) realizado!")
                transactionsHistoryService.addTransaction(message: "Saque no valor de \(amount.formatCurrency())")
                return true
            }
            return false
        case .deposit:
            balance += amount
            notificationService.sendNotification(message: "Depósito no valor de \(amount.formatCurrency()) realizado!")
            transactionsHistoryService.addTransaction(message: "Depósito no valor de \(amount.formatCurrency())")
            return true
        }
    }
    
    func requestLoan(amount: Double) {
        // Pedir um empréstimo
    }
    
    func calculateInterestRate() {
        // Calcular taxa de juros
    }
    
}
