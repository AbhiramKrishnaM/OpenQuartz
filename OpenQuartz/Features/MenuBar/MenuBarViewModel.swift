//
//  MenuBarViewModel.swift
//  OpenQuartz
//
//  Created by Abhiram Krishna M on 06/08/26.
//

import Foundation

@Observable
class MenubarViewModel {
    var sessionPercent: Double = 0
    
    func refreshUsage() async{
        do{
            let keychain = KeychainService()
            let data = try keychain.readClaudeCredentials()
            let decoder = JSONDecoder()
            let credentials = try decoder.decode(ClaudeCredentials.self, from: data)
            
            let usageService = ClaudeUsageService()
            
            
            let usage = try await usageService.fetchUsage(accessToken: credentials.claudeAiOauth.accessToken)
            
            sessionPercent = usage.fiveHour?.utilization ?? 0
        }catch {
            
        }
    }
}
