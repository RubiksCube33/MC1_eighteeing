import Foundation
import SwiftUI

struct Clothes: Hashable, Codable, Identifiable {
    var name: String
    var description: String
    var category: String
    var imageName: String
    var id: String
}
