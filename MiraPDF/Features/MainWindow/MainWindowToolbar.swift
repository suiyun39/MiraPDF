import SwiftUI

/// 主窗口工具栏配置
struct MainWindowToolbar: ToolbarContent {
  @Binding
  var assistantPresented: Bool

  var body: some ToolbarContent {
    // 文稿缩放按钮组
    ToolbarItemGroup(placement: .primaryAction) {
      Button("", systemImage: "minus.magnifyingglass") {
        // todo: 实现功能
      }
      .help("toolbar.help.zoom-out")

      Button("", systemImage: "1.magnifyingglass") {
        // todo: 实现功能
      }
      .help("toolbar.help.zoom-fit")

      Button("", systemImage: "plus.magnifyingglass") {
        // todo: 实现功能
      }
      .help("toolbar.help.zoom-in")
    }

    // AI 助手
    ToolbarSpacer()
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
