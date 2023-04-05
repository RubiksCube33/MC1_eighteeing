//
//  TomorrowRubiksLookApp.swift
//  TomorrowRubiksLook
//
//  Created by NemoSquare on 2023/04/03.
//

import SwiftUI

@main
struct TomorrowRubiksLookApp: App {
    //let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OB1View()
        }
    }
}

struct AppMain_Previews: PreviewProvider {
    static var previews: some View {
        OB1View()
    }
}
