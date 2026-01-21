import SwiftUI

struct MainWindowView: View {
  @State
  private var vm = MainWindowViewModel()

  // 由侧边栏模式计算布局模式
  // 用户通过拖动等方式也可以打开关闭侧边栏，因此需要反向同步以防止状态不一致
  private var columnVisibility: Binding<NavigationSplitViewVisibility> {
    Binding(
      get: {
        return vm.sidebarMode == .none ? .detailOnly : .all
      },
      set: { value in
        if value == .detailOnly && vm.sidebarMode != .none {
          vm.sidebarMode = .none
          return
        }
        if value == .all && vm.sidebarMode == .none {
          vm.sidebarMode = .outline
          return
        }
      },
    )
  }

  @State
  private var isPresented = false

  var body: some View {
    NavigationSplitView(
      columnVisibility: columnVisibility,
      sidebar: {
        // todo: 临时占位，侧栏宽度后续增加内容后再调整
        Text(verbatim: "sidebar")
          .toolbar(removing: .sidebarToggle)
          .toolbar {
            SidebarToolbar(sidebarMode: $vm.sidebarMode)
          }

          // min 应始终不小于 200，否则会导致侧边栏折叠时切换按钮消失
          // 必须在 toolbar 之后配置
          .navigationSplitViewColumnWidth(min: 200, ideal: 260, max: 320)
      },
      detail: {
        // todo: 临时占位，后续换为 pdf 阅读器
        ScrollView {
          Text(vm.sidebarMode.displayName).animation(nil)
          Rectangle().fill(.gray).frame(height: 2000).padding()
        }
      },
    )
    .animation(.snappy, value: columnVisibility.wrappedValue)

    // 右侧辅助面板，初步设计为承载 AI 助手
    .inspector(isPresented: $isPresented) {
      Text(verbatim: "AI Assistant Panel")
        .inspectorColumnWidth(min: 340, ideal: 420, max: 560)
    }
    .toolbar {
      windowToolbar
    }
  }

  // 工具栏配置
  @ToolbarContentBuilder
  private var windowToolbar: some ToolbarContent {
    // todo: 临时占位，后续精细化
    ToolbarItem(placement: .primaryAction) {
      Button(String(), systemImage: "sparkles") {
        withAnimation {
          isPresented.toggle()
        }
      }
    }
  }
}
