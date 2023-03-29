import Foundation
import SwiftUI
import Combine

struct GameStart: View {
    
    @Binding var isGameStarted: Bool
    @State var isTimeOver : Bool = false
    
    var body: some View {
        NavigationView(){
            ZStack{
                Image("background")
                    .ignoresSafeArea()
                VStack{
                    Spacer()

                    Text("MISSION")
                        .padding(.init(top: 7, leading: 21, bottom: 7, trailing: 21))
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .font(.system(size:18, weight: .semibold))
                                    
                    Text("내일의 루빅룩을\n추측해보세요!")
                        .multilineTextAlignment(.center)
                        .font(.system(size:30, weight: .bold))
                        .padding(.bottom, 50.0)
                        .padding(.top, 40.0)
                                    
                    Image("rubik2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, -235.0)
                    
                    /* NavigationLink(destination: GameHome(),isActive: $isTimeOver){
                        
                    } */
                }
            }
        }.navigationBarBackButtonHidden(true)
            .onAppear{
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                    isGameStarted = false
                }
            }
    }
}

struct GameStart_Previews: PreviewProvider {
    static var previews: some View {
        GameHome()
    }
}
