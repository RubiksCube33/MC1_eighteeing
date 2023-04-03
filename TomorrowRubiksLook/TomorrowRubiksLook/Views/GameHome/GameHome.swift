import SwiftUI

struct CustomColor{
    static let BackgroundColor = Color("BackgroundColor")
}

struct GameHome: View {
    
    @State var isGameStarted: Bool = false
    //Home 으로 돌아올지 말지를 결정하는 변수, 뒤에 호출할 view들에 binding으로 넘겨줘야
    //한방에 여기 화면으로 돌아올 수 있음!!
    
    var body: some View {
        NavigationView(){
            ZStack{
                CustomColor.BackgroundColor.ignoresSafeArea()
                VStack {
                    Image("rubik_look")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, -110.0)
                    
                    Image("rubik_card")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, -30)
                        .padding(.bottom, 25)

                    NavigationLink(destination: GameStart(isGameStarted: $isGameStarted), isActive: $isGameStarted){
                        Text("Game Start")
                            .padding(.init(top: 14, leading: 54, bottom: 14, trailing: 54))
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 150))
                            .font(.system(size:28, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, -500.0)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GameHome()
    }
}
