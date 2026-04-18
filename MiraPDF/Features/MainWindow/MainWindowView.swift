import SwiftUI

struct MainWindowView: View {
  @Environment(WindowStore.self)
  private var store

  // 由侧边栏模式计算窗口布局模式
  // 用户通过拖动等方式也可以打开关闭侧边栏，因此需要反向同步
  private var columnVisibility: Binding<NavigationSplitViewVisibility> {
    Binding(
      get: {
        return store.sidebarMode == .none ? .detailOnly : .all
      },
      set: { next in
        if next == .detailOnly && store.sidebarMode != .none {
          store.sidebarMode = .none
          return
        }
        if next == .all && store.sidebarMode == .none {
          store.sidebarMode = .outline
          return
        }
      }
    )
  }

  var body: some View {
    // 必要的写法，ref: https://developer.apple.com/documentation/swiftui/bindable
    @Bindable var store = store

    NavigationSplitView(
      columnVisibility: columnVisibility,
      sidebar: {
        // todo: 临时占位，侧栏宽度后续增加内容后再调整
        Text(verbatim: "sidebar")
          .toolbar(removing: .sidebarToggle)
          .toolbar {
            SidebarToolbar(sidebarMode: $store.sidebarMode)
          }
          // 必须在 toolbar 之后配置。min 小于 200 会导致侧边栏折叠时切换按钮消失
          .navigationSplitViewColumnWidth(min: 200, ideal: 260, max: 320)
      },
      detail: {
        // todo: 临时占位，后续换为 pdf 阅读器
        EmptyView()
      },
    )
  }
}
