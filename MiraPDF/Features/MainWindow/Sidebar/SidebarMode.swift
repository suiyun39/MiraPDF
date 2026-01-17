import Foundation

/// 侧边栏模式
enum SidebarMode: String, CaseIterable {
  /// 隐藏侧边栏
  case none = "none"

  /// 显示目录
  case outline = "outline"

  /// 显示缩略图
  case thumbnail = "thumbnail"

  /// 显示书签列表
  case bookmark = "bookmark"
}

extension SidebarMode {
  /// 本地化显示名称
  var displayName: LocalizedStringResource {
    switch self {
    case .none: "sidebar.mode.none"
    case .outline: "sidebar.mode.outline"
    case .thumbnail: "sidebar.mode.thumbnail"
    case .bookmark: "sidebar.mode.bookmark"
    }
  }
}
