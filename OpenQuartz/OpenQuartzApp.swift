import SwiftUI

@main
struct OpenQuartzApp: App {
    @State private var viewModal = MenubarViewModel()
    
    init(){
        let vm = viewModal
        Task {
            await vm.refreshUsage()
        }
    }
    
    var body: some Scene {
        MenuBarExtra("OQ \(Int(viewModal.sessionPercent))", systemImage: "gauge" ){
            Text("Claude session: \(Int(viewModal.sessionPercent))% used")
            Text("Resets in 2h 15m")
            Divider()
            Button("Quit"){NSApplication.shared.terminate(nil)}
        }
    }
}
