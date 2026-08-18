import Foundation
import UserNotifications

struct NotificationService {
    
    func requestPermission() async {
        let center = UNUserNotificationCenter.current()
        do {
            try await center.requestAuthorization(options: [.alert, .sound])
        } catch {
            print("Notification permission error: \(error)")
        }
    }
    
    
    func sendThresholdAlert(percent: Int){
let content = UNMutableNotificationContent()
        content.title = "Claude Usage Alert"
        content.body = "You've used \(percent)% of your session limit."
        content.sound = .default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request)
    }
}
