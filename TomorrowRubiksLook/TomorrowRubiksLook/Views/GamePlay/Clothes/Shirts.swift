import SwiftUI

class Shirts: ObservableObject {
    @Published var shirtsitems: [ClothItem]
    
    let shirtnames: [String] = ["꾸미는 날 입는\n블랙 스트라이프 T","유일한 컬러티셔츠?\n다크 카키T","블랙으로 보이지만\n나름 네이비 T","나름 포인트 있는!\n레이어드 블랙T","화사하고 싶을 땐?\n화이트 스트라이프 T","무난무난\n그냥 그레이 T",]
    
    let shirtdescriptions: [String] = ["이걸 입으면 팀원들이\n오늘은 확실히 옷이 바뀌었다는 것을\n알아차린다.","평범한 카키색 티셔츠다.\n한두번 입었는데\n아무도 내가 이런 옷을 입었다는 것을\n모르고 있다...","사실 검은색이 아니라\n진한 남색이다!\n\n좀 어둡고 흐린 날에 입는 경우가 많다.","목 부분하고 맨 아랫 부분에\n흰색 줄이 1개씩 있다.\n제일 중요한 포.인.트!","밝은 옷은 덩치가 커보여서 입지 않지만...\n줄무늬와 함께라면 착시현상 덕분에\n두렵지 않다!","사진이 이상하게 찍혀서\n녹색 빛이 돌지만\n실제로 보면 회색이다.",]
    
    init() {
        shirtsitems = []
        for i in 0..<6 {
            let new = ClothItem(id: i, imagename: "shirts\(i+1)",    realimagename: "ishirts\(i+1)",name: shirtnames[i], description: shirtdescriptions[i])
            shirtsitems.append(new)
        }
    }
}
