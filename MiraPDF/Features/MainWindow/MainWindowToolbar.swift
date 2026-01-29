import SwiftUI

/// 主窗口工具栏配置
struct MainWindowToolbar: ToolbarContent {
  @Binding
  var assistantPresented: Bool

  var body: some ToolbarContent {
    // AI 助手
    ToolbarItem(placement: .primaryAction) {
      Button("", systemImage: "sparkles") {
        withAnimation(.snappy) {
          assistantPresented.toggle()
        }
      }
      .help("toolbar.help.ai-assistant")
    }
  }
}
