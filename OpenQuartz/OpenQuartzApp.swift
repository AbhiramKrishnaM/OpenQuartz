import SwiftUI

@main
struct OpenQuartzApp: App {
    var body: some Scene {
        MenuBarExtra("OQ 42%", systemImage: "gauge" ){
            Text("Claude session: 42% used")
            Text("Resets in 2h 15m")
            Divider()
            Button("Quit"){NSApplication.shared.terminate(nil)}
        }
    }
}
