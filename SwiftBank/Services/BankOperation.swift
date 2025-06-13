//
//  BankOperation.swift
//  SwiftBank
//
//  Created by Juliano Sgarbossa on 13/06/25.
//

import Foundation

protocol BankOperation {
    func execute(account: BankAccount, amount: Double) -> Bool
}

class WithdrawOperation: BankOperation {
    func execute(account: BankAccount, amount: Double) -> Bool {
        if amount <= account.balance {
            account.balance -= amount
            account.notificationService.sendNotification(message: "Saque no valor de \(amount.formatCurrency()) realizado!")
            account.transactionsHistoryService.addTransaction(message: "Saque no valor de \(amount.formatCurrency())")
            return true
        }
        return false
    }
}

class DepositOperation: BankOperation {
    func execute(account: BankAccount, amount: Double) -> Bool {
        account.balance += amount
        account.notificationService.sendNotification(message: "Depósito no valor de \(amount.formatCurrency()) realizado!")
        account.transactionsHistoryService.addTransaction(message: "Depósito no valor de \(amount.formatCurrency())")
        return true
    }
}
