import OSLog
import PDFKit
import SwiftUI
import UniformTypeIdentifiers

enum PDFDocumentAdapterError: LocalizedError {
  case unknown
  case emptyFile
  case corruptFile

  var failureReason: String? {
    switch self {
    case .unknown: String(localized: "error.unknown.reason", table: "ErrorMessage")
    case .emptyFile: String(localized: "error.empty_file.reason", table: "ErrorMessage")
    case .corruptFile: String(localized: "error.corrupt_file.reason", table: "ErrorMessage")
    }
  }

  var recoverySuggestion: String? {
    switch self {
    case .unknown: nil
    case .emptyFile: nil
    case .corruptFile: String(localized: "error.corrupt_file.suggestion", table: "ErrorMessage")
    }
  }
}

/// DocumentGroup 文档适配器，应仅用于处理 pdf 文件读取与写入
struct PDFDocumentAdapter: FileDocument {
  static var readableContentTypes: [UTType] {
    [.pdf]
  }

  private let logger = Logger(category: "Core")

  /// PDFKit 文档实例
  let document: PDFDocument

  // 仅用于满足 DocumentGroup 类型签名，此处不应有任何逻辑
  init() {
    self.document = PDFDocument()
  }

  init(configuration: ReadConfiguration) throws {
    logger.info("打开文件「\(configuration.file.filename ?? "未命名")」")

    // 空数据检查
    guard let data = configuration.file.regularFileContents else {
      logger.error("文件数据读取失败")
      throw PDFDocumentAdapterError.unknown
    }
    guard !data.isEmpty else {
      logger.error("文件数据为空")
      throw PDFDocumentAdapterError.emptyFile
    }

    // 文件头检查，[0x25, 0x50, 0x44, 0x46, 0x2d] -> "%PDF-"
    guard data.starts(with: [0x25, 0x50, 0x44, 0x46, 0x2d]) else {
      logger.error("文件头校验错误，不是有效的 pdf 文件")
      throw PDFDocumentAdapterError.corruptFile
    }

    logger.info("文件加载成功，文件大小 \(data.count) 字节")

    guard let document = PDFDocument(data: data) else {
      logger.error("文件解析失败，无法构建 PDFDocument 实例")
      throw PDFDocumentAdapterError.corruptFile
    }
    self.document = document

    logger.info("文件解析完成，PDF V\(document.majorVersion).\(document.minorVersion)")
    logger.info("\(document.isEncrypted ? "已加密文档" : "未加密文档")，共 \(document.pageCount) 页")
  }

  func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
    // todo: 实现文件保存逻辑
    throw CocoaError(.featureUnsupported)
  }
}
