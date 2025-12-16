import SwiftUI

/// 应用自定义菜单栏
struct AppCommands: Commands {
  var body: some Commands {
    CommandGroup(replacing: .appInfo) {
      Button("menu.about", systemImage: "info.circle") {
        // todo: 后续修改为自定义的关于窗口
        NSApplication.shared.orderFrontStandardAboutPanel()
      }
    }
  }
}
