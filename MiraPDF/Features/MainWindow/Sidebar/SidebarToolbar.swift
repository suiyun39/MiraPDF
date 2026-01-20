import SwiftUI

/// 侧边栏工具栏配置
struct SidebarToolbar: ToolbarContent {
  @Binding
  var sidebarMode: SidebarMode

  var body: some ToolbarContent {
    ToolbarSpacer()

    // 侧边栏模式切换按钮
    ToolbarItem(placement: .primaryAction) {
      // todo: 后续改为菜单以展示所有的模式
      Button("", systemImage: "sidebar.left") {
        withAnimation(.snappy) {
          sidebarMode = sidebarMode == .none ? .outline : .none
        }
      }
      .help("toolbar.help.toggle_sidebar_mode")
    }
  }
}
