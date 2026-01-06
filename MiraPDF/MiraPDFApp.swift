import OSLog
import SwiftUI

@main
struct MiraPDFApp: App {
  private let logger = Logger()

  init() {
    logger.info("Ciallo～(∠·ω< )⌒★")
  }

  var body: some Scene {
    DocumentGroup(newDocument: PDFDocumentFile()) { configuration in
      Text(configuration.fileURL?.absoluteString ?? "")
    }

    Settings {
      EmptyView()
    }
    .commands {
      AppCommands()
    }
  }
}
