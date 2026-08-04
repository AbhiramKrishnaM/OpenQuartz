//
//  KeychainService.swift
//  OpenQuartz
//
//  Created by Abhiram Krishna M on 31/07/26.
//

import Foundation

enum KeychainError: Error {
    case notFound
    case unexpectedData
}

struct KeychainService {
    func readClaudeCredentials() throws -> Data {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "Claude Code-credentials",
            kSecAttrAccount as String: "abhiramkrishnam",
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess else {
            throw KeychainError.notFound
        }
        
        guard let data = result as? Data else{
            throw KeychainError.unexpectedData
        }
        
        return data
    }
}
