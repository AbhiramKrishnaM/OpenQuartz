import SwiftUI

@main
struct OpenQuartzApp: App {
    
    init(){
      let keychain = KeychainService()
        do {
            let data = try keychain.readClaudeCredentials()
            let jsonstring = String(data: data, encoding: .utf8) ?? "count not decode as text"
            print("Found credentials:")
            print(jsonstring)
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
