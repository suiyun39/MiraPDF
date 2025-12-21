import SwiftUI

/// 自定义关于视图
struct AboutView: View {
  @State
  private var vm = AboutViewModel()

  var body: some View {
    HStack {
      ZStack {
        Image(nsImage: NSApp.applicationIconImage).frame(width: 104, height: 104)
      }
      .padding(.horizontal, 40)

      VStack(alignment: .leading, spacing: 4) {
        Text(verbatim: vm.appname).font(.largeTitle).fontWeight(.semibold)
        Text(verbatim: "Version \(vm.version)").font(.body).foregroundStyle(.secondary)
        Spacer()

        Text(verbatim: "Copyright (c) 2025 suiyun39. Released under the MIT License.")
          .font(.footnote)
          .foregroundStyle(.secondary)

        HStack(spacing: 8) {
          Button("about.button.homepage") {
            vm.openHomepage()
          }
          Button("about.button.feedback") {
            vm.openFeedback()
          }
        }
        .padding(.top, 4)
        .frame(maxWidth: .infinity, alignment: .trailing)
      }
      .padding(.vertical)
      .padding(.trailing)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    .frame(width: 480, height: 184)
  }
}

#Preview {
  AboutView()
}
