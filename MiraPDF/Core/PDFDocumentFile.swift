import OSLog
import SwiftUI
import UniformTypeIdentifiers

/// pdf 文档抽象，用于处理 pdf 文件序列化与反序列化
struct PDFDocumentFile: FileDocument {
  static var readableContentTypes: [UTType] {
    [.pdf]
  }

  private let logger = Logger(category: "Core")

  // 仅用于满足 DocumentGroup 类型签名，此处不应有任何逻辑
  init() {
  }

  init(configuration: ReadConfiguration) throws {
    logger.info("打开文件「\(configuration.file.filename ?? "未命名")」")

    guard let data = configuration.file.regularFileContents else {
      logger.error("读取文件内容失败")
      throw CocoaError(.fileReadCorruptFile)
    }

    // 检查 pdf 文件头，[0x25, 0x50, 0x44, 0x46] -> "%PDF"
    guard data.starts(with: [0x25, 0x50, 0x44, 0x46]) else {
      logger.error("不是有效的 pdf 文件")
      throw CocoaError(.fileReadCorruptFile)
    }

    // todo: 创建 PDFKit 实例
    logger.info("文件加载成功，文件大小 \(data.count) 字节")
  }

  func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
    // todo: 实现文件保存逻辑
    throw CocoaError(.featureUnsupported)
  }
}
