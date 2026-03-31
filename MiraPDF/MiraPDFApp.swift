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
      let store = WindowStore(document: configuration.document.document)

      MainWindowView()
        .environment(store)
    }
    .windowToolbarLabelStyle(fixed: .iconOnly)

    Settings {
      EmptyView()
    }
    .commands {
      AppCommands()
    }
  }
}
