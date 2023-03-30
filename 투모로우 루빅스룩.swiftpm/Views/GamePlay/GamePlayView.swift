//
//  GamePlayView.swift
//  
//
//  Created by 김하은 on 2023/03/30.
//

import SwiftUI

struct Item: Identifiable {
    var id: Int
    var imagename: String
    var realimagename: String
    var name: String
    var description: String
}

class Shirts: ObservableObject {
    @Published var shirtsitems: [Item]
    
    let shirtnames: [String] = ["꾸미는 날 입는\n블랙 스트라이프 T","유일한 컬러티셔츠?\n다크 카키T","블랙으로 보이지만\n나름 네이비 T","나름 포인트 있는!\n레이어드 블랙T","화사하고 싶을 땐?\n화이트 스트라이프 T","무난무난\n그냥 그레이 T",]
    
    let shirtdescriptions: [String] = ["이걸 입으면 팀원들이\n오늘은 확실히 옷이 바뀌었다는 것을\n알아차린다.","평범한 카키색 티셔츠다.\n한두번 입었는데\n아무도 내가 이런 옷을 입었다는 것을\n모르고 있다...","사실 검은색이 아니라\n진한 남색이다!\n\n좀 어둡고 흐린 날에 입는 경우가 많다.","목 부분하고 맨 아랫 부분에\n흰색 줄이 1개씩 있다.\n제일 중요한 포.인.트!","밝은 옷은 덩치가 커보여서 입지 않지만...\n줄무늬와 함께라면 착시현상 덕분에\n두렵지 않다!","사진이 이상하게 찍혀서\n녹색 빛이 돌지만\n실제로 보면 회색이다.",]
    
    init() {
        shirtsitems = []
        for i in 0..<6 {
            let new = Item(id: i, imagename: "shirts\(i+1)",    realimagename: "ishirts\(i+1)",name: shirtnames[i], description: shirtdescriptions[i])
            shirtsitems.append(new)
        }
    }
}

class Pants: ObservableObject {
    @Published var pantsitems: [Item]
    
    let pantsnames: [String] = ["어두운 청바지\n스티치 포인트","멋쟁이 워싱 청바지","좀 밝은 청바지\n갈색 스티치 포인트"]
    
    let pantsdescriptions: [String] = ["여름에 자주 입는 얇은 청바지.\n날씨가 더워지길래 꺼내봤다가\n코로나 걸려서 지금은 봉인중...","약간의 포인트가 들어간\n적당히 따뜻한 청바지\n요즘 날씨에 입기 좋다.","좀더 밋밋한 맛이 있는 청바지\n마찬가지로 요즘 날씨에 입기 좋다."]
    
    init() {
        pantsitems = []
        for i in 0..<3 {
            let new = Item(id: i, imagename: "pants\(i+1)", realimagename: "ipants\(i+1)",name: pantsnames[i], description: pantsdescriptions[i])
            pantsitems.append(new)
        }
    }
}

struct GamePlayView: View {
    @State private var showShirtsModal = false
    @State private var showPantsModal = false
    
    @Binding var isGameStarted: Bool
    @State var isGameOver : Bool = false
    
    @StateObject var shirts = Shirts()
    @StateObject var pants = Pants()
    @State private var snappedShirtsItem = 0.0
    @State private var draggingShirtsItem = 0.0
    @State var activeShirtsIndex: Int = 0 //선택한 상의 인덱스
    @State private var snappedPantsItem = 0.0
    @State private var draggingPantsItem = 0.0
    @State var activePantsIndex: Int = 0 //선택한 하의 인덱스

    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("옆으로 스와이프 해서 ")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .padding(.top, 70.0)
                    Text("루빅룩을 골라주세요!")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .padding(.top, 0.0)
                    
                    Text("옷을 클릭하면 옷의 스토리를 볼 수 있어요")
                        .padding(.init(top: 2, leading: 0, bottom: 25, trailing: 0))
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color(red: 0.229, green: 0.229, blue: 0.229))
                    
                    ZStack { //상의
                        ForEach(shirts.shirtsitems) { shirtsitem in
                            
                            // article view
                            ZStack {
                                Button(action: {showShirtsModal = true}){
                                    Image(shirtsitem.imagename)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                                
                            }
                            .frame(width: 300, height: 180)
                            
                            .scaleEffect(1.0 - abs(distanceforshirts(shirtsitem.id)) * 0.2 )
                            .opacity(1.0 - abs(distanceforshirts(shirtsitem.id)) * 0.3 )
                            .offset(x: myXOffsetforshirts(shirtsitem.id), y: 0)
                            .zIndex(1.0 - abs(distanceforshirts(shirtsitem.id)) * 0.1)
                           
                            // Here is the modifier - on the item, not on the ForEach
                            .onTapGesture {
                                
                                // withAnimation is necessary
                                withAnimation {
                                    
                                    draggingShirtsItem = Double(shirtsitem.id)
                                }
                            }
                            
                            
                        }
                    }
                    .gesture(getDragGestureforshirts())
                    .padding(.bottom, 25.0)
                    
                    
                    ZStack { //하의
                        ForEach(pants.pantsitems) { pantsitem in
                            
                            // article view
                      
                            ZStack {
                                Button(action: {showPantsModal = true}){
                                    Image(pantsitem.imagename)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                            
                            .frame(width: 200, height: 250)
                            
                            .scaleEffect(1.0 - abs(distanceforpants(pantsitem.id)) * 0.2 )
                            .opacity(1.0 - abs(distanceforpants(pantsitem.id)) * 0.3 )
                            .offset(x: myXOffsetforpants(pantsitem.id), y: 0)
                            .zIndex(1.0 - abs(distanceforpants(pantsitem.id)) * 0.1)
                            
                            // Here is the modifier - on the item, not on the ForEach
                            .onTapGesture {
                                
                                // withAnimation is necessary
                                withAnimation {
                                    draggingPantsItem = Double(pantsitem.id)
                                }
                            }
                            
                        }
                    }
                    .gesture(getDragGestureforpants())
                    .padding(.bottom, 50.0)
                    
                    
                    NavigationLink (destination:
                                        GameResultView( isGameStarted: $isGameStarted, isGameOver: $isGameOver,activeShirtsIndex:$activeShirtsIndex,activePantsIndex:$activePantsIndex),isActive: $isGameOver){
                        Text("제 픽은 이거에요!")
                            .padding(.init(top: 20, leading: 108, bottom: 20, trailing: 108))
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                    }
                   
                }
                ModalView(isShowing: $showShirtsModal,
                          name: $shirts.shirtsitems[activeShirtsIndex].name,
                          description: $shirts.shirtsitems[activeShirtsIndex].description,
                          image:
                            $shirts.shirtsitems[activeShirtsIndex].realimagename
                )
                ModalView(isShowing: $showPantsModal,
                          name: $pants.pantsitems[activePantsIndex].name,
                          description: $pants.pantsitems[activePantsIndex].description,
                          image:
                            $pants.pantsitems[activePantsIndex].realimagename
                )
            }
        }.navigationBarBackButtonHidden(true)
    }
    private func getDragGestureforshirts() -> some Gesture {
           DragGesture()
               .onChanged { value in
                   draggingShirtsItem = snappedShirtsItem + value.translation.width / 100
               }
               .onEnded { value in
                   withAnimation {
                       draggingShirtsItem = snappedShirtsItem + value.predictedEndTranslation.width / 100
                       draggingShirtsItem = round(draggingShirtsItem).remainder(dividingBy: Double(shirts.shirtsitems.count))
                       snappedShirtsItem = draggingShirtsItem
                       
                       //Get the active Item index
                       self.activeShirtsIndex = shirts.shirtsitems.count + Int(draggingShirtsItem)
                       if self.activeShirtsIndex > shirts.shirtsitems.count || Int(draggingShirtsItem) >= 0 {
                           self.activeShirtsIndex = Int(draggingShirtsItem)
                       }
                   }
               }
       }
    
    func distanceforshirts(_ item: Int) -> Double {
           return (draggingShirtsItem - Double(item)).remainder(dividingBy: Double(shirts.shirtsitems.count))
       }
       
   func myXOffsetforshirts(_ item: Int) -> Double {
       let angle = Double.pi * 2 / Double(shirts.shirtsitems.count) * distanceforshirts(item)
       return sin(angle) * 200
   }
    
    private func getDragGestureforpants() -> some Gesture {
           DragGesture()
               .onChanged { value in
                   draggingPantsItem = snappedPantsItem + value.translation.width / 100
               }
               .onEnded { value in
                   withAnimation {
                       draggingPantsItem = snappedPantsItem + value.predictedEndTranslation.width / 100
                       draggingPantsItem = round(draggingPantsItem).remainder(dividingBy: Double(pants.pantsitems.count))
                       snappedPantsItem = draggingPantsItem
                       
                       //Get the active Item index
                       self.activePantsIndex = pants.pantsitems.count + Int(draggingPantsItem)
                       if self.activePantsIndex > pants.pantsitems.count || Int(draggingPantsItem) >= 0 {
                           self.activePantsIndex = Int(draggingPantsItem)
                       }
                   }
               }
       }
    
    func distanceforpants(_ item: Int) -> Double {
           return (draggingPantsItem - Double(item)).remainder(dividingBy: Double(pants.pantsitems.count))
       }
       
   func myXOffsetforpants(_ item: Int) -> Double {
       let angle = Double.pi * 2 / Double(pants.pantsitems.count) * distanceforpants(item)
       return sin(angle) * 200
   }
}


struct GamePlayView_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayView(isGameStarted: .constant(false))
    }
}
