import SwiftUI

struct MainWindowView: View {
  @State
  private var columnVisibility = NavigationSplitViewVisibility.detailOnly

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
  }
}
