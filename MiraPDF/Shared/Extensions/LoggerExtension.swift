import OSLog

extension Logger {
  init(category: String) {
    let bundleIdentifier = Bundle.main.bundleIdentifier ?? ""
    self.init(subsystem: bundleIdentifier, category: category)
  }
}
