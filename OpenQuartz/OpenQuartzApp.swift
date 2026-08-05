import SwiftUI

@main
struct OpenQuartzApp: App {
    
    init(){
      let keychain = KeychainService()
        do {
            let data = try keychain.readClaudeCredentials()
            let decoder = JSONDecoder()
            let credentials = try decoder.decode(ClaudeCredentials.self, from: data)
            print("Access token starts with: \(credentials.claudeAiOauth.accessToken.prefix(15))")
            
        } catch{
            print("Failed to read Keychain: \(error)")
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
