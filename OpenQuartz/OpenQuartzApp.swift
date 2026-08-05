import SwiftUI

@main
struct OpenQuartzApp: App {
    
    init(){
        Task{
        let keychain = KeychainService()
            do {
                let data = try keychain.readClaudeCredentials()
                let decoder = JSONDecoder()
                let credentials = try decoder.decode(ClaudeCredentials.self, from: data)
                
                let usageService = ClaudeUsageService()
                let usage = try await usageService.fetchUsage(accessToken: credentials.claudeAiOauth.accessToken)
                
                print("Session usage: \(usage.fiveHour?.utilization ?? -1)%")
                print("Weekly usage: \(usage.sevenDay?.utilization ?? -1)%")
            } catch{
                print("Failed to read Keychain: \(error)")
            }
        }
    }
    
    var body: some Scene {
        MenuBarExtra("OQ 42%", systemImage: "gauge" ){
            Text("Claude session: 42% used")
            Text("Resets in 2h 15m")
            Divider()
            Button("Quit"){NSApplication.shared.terminate(nil)}
        }
    }
}
