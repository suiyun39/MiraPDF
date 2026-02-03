import Observation

@Observable
final class MainWindowViewModel {
  /// 侧边栏模式
  var sidebarMode = SidebarMode.none

  /// 搜索关键字
  var searchKeyword = ""
}
