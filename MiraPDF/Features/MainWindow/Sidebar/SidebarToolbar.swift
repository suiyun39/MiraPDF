import SwiftUI

/// 侧边栏工具栏配置
struct SidebarToolbar: ToolbarContent {
  @Binding
  var sidebarMode: SidebarMode

  var body: some ToolbarContent {
    ToolbarSpacer()

    // 侧边栏模式切换按钮
    ToolbarItem(placement: .primaryAction) {
      Menu {
        Picker("", selection: $sidebarMode) {
          ForEach(SidebarMode.allCases, id: \.self) { mode in
            Text(mode.displayName).tag(mode)
          }
        }
        .pickerStyle(.inline)
        .labelsHidden()
      } label: {
        Image(systemName: "sidebar.left")
      }
      .help("toolbar.help.toggle_sidebar_mode")
    }
  }
}
