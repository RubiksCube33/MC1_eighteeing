import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            GameHome()
        }
    }
}

struct MyApp_Previews: PreviewProvider {
    static var previews: some View {
        GameHome()
    }
}
