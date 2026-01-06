import OSLog
import SwiftUI

@main
struct MiraPDFApp: App {
  private let logger = Logger()

  init() {
    logger.info("Ciallo～(∠·ω< )⌒★")
  }

  var body: some Scene {
    Settings {
      EmptyView()
    }
    .commands {
      AppCommands()
    }
  }
}
