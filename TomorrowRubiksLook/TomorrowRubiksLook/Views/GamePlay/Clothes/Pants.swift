import SwiftUI

class Pants: ObservableObject {
    @Published var pantsitems: [ClothItem]
    
    let pantsnames: [String] = ["어두운 청바지\n스티치 포인트","멋쟁이 워싱 청바지","좀 밝은 청바지\n갈색 스티치 포인트"]
    
    let pantsdescriptions: [String] = ["여름에 자주 입는 얇은 청바지.\n날씨가 더워지길래 꺼내봤다가\n코로나 걸려서 지금은 봉인중...","약간의 포인트가 들어간\n적당히 따뜻한 청바지\n요즘 날씨에 입기 좋다.","좀더 밋밋한 맛이 있는 청바지\n마찬가지로 요즘 날씨에 입기 좋다."]
    
    init() {
        pantsitems = []
        for i in 0..<3 {
            let new = ClothItem(id: i, imagename: "pants\(i+1)", realimagename: "ipants\(i+1)",name: pantsnames[i], description: pantsdescriptions[i])
            pantsitems.append(new)
        }
    }
}
