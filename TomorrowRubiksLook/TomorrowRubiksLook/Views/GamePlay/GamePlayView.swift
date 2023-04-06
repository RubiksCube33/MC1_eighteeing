import SwiftUI

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
                                        GameResultView( isGameStarted: $isGameStarted, isGameOver: $isGameOver,activeShirtsIndex:activeShirtsIndex,activePantsIndex:activePantsIndex),isActive: $isGameOver){
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
