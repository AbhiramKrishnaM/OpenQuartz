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
    private var timer: Timer?
    
    private var hasWarned75 = false
    private var hasWarned90 = false
    private let notificationService = NotificationService()
    
    
    
    func refreshUsage() async{
        do{
            let keychain = KeychainService()
            let data = try keychain.readClaudeCredentials()
            let decoder = JSONDecoder()
            let credentials = try decoder.decode(ClaudeCredentials.self, from: data)
            
            let usageService = ClaudeUsageService()
            
            
            let usage = try await usageService.fetchUsage(accessToken: credentials.claudeAiOauth.accessToken)
            
            sessionPercent = usage.fiveHour?.utilization ?? 0
            
            if sessionPercent >= 90 && !hasWarned90{
                notificationService.sendThresholdAlert(percent: 90)
                hasWarned90 = true
            } else if sessionPercent >= 75 && !hasWarned75{
                notificationService.sendThresholdAlert(percent: 75)
                hasWarned75 = true
            }
            
            if sessionPercent < 75 {
                hasWarned75 = false
                hasWarned90 = false
            }
            
            
        }catch {
            
        }
    }
    
    func startPolling(){
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true){ _ in
            Task {
                await self.refreshUsage()
            }
        }
        
    }
    
}
