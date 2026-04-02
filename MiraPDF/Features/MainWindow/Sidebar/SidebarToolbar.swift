import SwiftUI

/// 侧边栏工具栏配置
struct SidebarToolbar: ToolbarContent {
  @Binding
  var sidebarMode: SidebarMode

  // 可通过菜单直接切换的模式
  private let modes: [SidebarMode] = [
    .none,
    .outline,
    .thumbnail,
    .bookmark,
  ]

  var body: some ToolbarContent {
    ToolbarSpacer()

    // 侧边栏模式切换按钮
    ToolbarItem(placement: .primaryAction) {
      Menu {
        Picker("", selection: $sidebarMode) {
          ForEach(modes, id: \.self) { mode in
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
