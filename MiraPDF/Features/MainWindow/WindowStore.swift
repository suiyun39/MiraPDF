import PDFKit
import SwiftUI

/// 窗口状态存储
@Observable
final class WindowStore {
  /// pdf 文档实例
  let document: PDFDocument

  /// 侧边栏模式
  var sidebarMode = SidebarMode.none

  init(document: PDFDocument) {
    self.document = document
  }
}
