import AppKit
import Foundation
import Observation

@Observable
final class AboutViewModel {
  var appname = ""
  var version = ""

  init() {
    self.appname = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
    self.version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
  }

  func openHomepage() {
    if let url = URL(string: "https://github.com/suiyun39/MiraPDF") {
      NSWorkspace.shared.open(url)
    }
  }

  func openFeedback() {
    if let url = URL(string: "https://github.com/suiyun39/MiraPDF/issues") {
      NSWorkspace.shared.open(url)
    }
  }
}
