import OSLog
import SwiftUI

@main
struct MiraPDFApp: App {
  private let logger = Logger(category: "App")

  init() {
    logger.info("Ciallo～(∠·ω< )⌒★")
  }

  var body: some Scene {
    DocumentGroup(newDocument: PDFDocumentAdapter()) { configuration in
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
