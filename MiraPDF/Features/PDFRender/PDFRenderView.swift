import PDFKit
import SwiftUI

/// pdf 渲染封装，当前版本使用 PDFKit 提供渲染能力
struct PDFRenderView: NSViewRepresentable {
  /// PDFKit 文档实例
  let document: PDFKit.PDFDocument

  func makeNSView(context: Context) -> PDFView {
    let pdfview = PDFView()
    pdfview.document = document

    // todo: 缩放、显示模式等状态应由外部传入
    pdfview.autoScales = true
    pdfview.displayMode = .singlePageContinuous

    return pdfview
  }

  func updateNSView(_ nsView: PDFView, context: Context) {
    // todo: 需要手动处理状态更新
  }
}
