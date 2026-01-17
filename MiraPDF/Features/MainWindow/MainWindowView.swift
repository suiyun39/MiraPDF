import SwiftUI

struct MainWindowView: View {
  @State
  private var columnVisibility = NavigationSplitViewVisibility.detailOnly

  @State
  private var isPresented = false

  var body: some View {
    NavigationSplitView(
      columnVisibility: $columnVisibility,
      sidebar: {
        // todo: 临时占位，侧栏宽度后续增加内容后再调整
        Text(verbatim: "sidebar")
          .navigationSplitViewColumnWidth(min: 200, ideal: 260, max: 320)
      },
      detail: {
        // todo: 临时占位，后续换为 pdf 阅读器
        ScrollView {
          Rectangle().fill(.gray).frame(height: 2000).padding()
        }
      },
    )

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
      Button("", systemImage: "sparkles") {
        withAnimation {
          isPresented.toggle()
        }
      }
    }
  }
}
