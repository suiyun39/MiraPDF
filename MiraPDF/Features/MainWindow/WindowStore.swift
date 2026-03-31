import PDFKit
import SwiftUI

/// 窗口状态存储
@Observable
final class WindowStore {
  /// pdf 文档实例
  let document: PDFDocument

  init(document: PDFDocument) {
    self.document = document
  }
}
