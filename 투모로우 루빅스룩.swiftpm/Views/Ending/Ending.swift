import SwiftUI

struct Ending: View {
    
    @Binding var isGameStarted: Bool
    @Binding var isGameOver : Bool
    
    var body: some View {
        ZStack {
            Image("background")
                .ignoresSafeArea()
            VStack {
                Text("당신이 고른")
                    .multilineTextAlignment(.center)
                    .font(.system(size:30, weight: .bold))
                    .padding(.bottom, 1.0)
                    .padding(.top, 100)
                
                Text("투모로우 루빅스 룩!")
                    .multilineTextAlignment(.center)
                    .font(.system(size:30, weight: .bold))
                
                Text("캡쳐 후 다음 날 루빅이\n정말 똑같이 입고왔나 비교해봐요!")
                    .multilineTextAlignment(.center)
                    .padding(.top, 1)
                    .opacity(0.5)
                
                ZStack{
                    Rectangle()
                        .background(.ultraThickMaterial)
                        .foregroundColor(.white)
                        .opacity(0.25)
                        .cornerRadius(30)
                    Image("룹기_파란4")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding(.bottom, 15.0)
                .padding([.leading, .trailing], 30)
                .padding(.top, 10.0)
                
                HStack {
                    Button(action: {isGameStarted = false}, label:{
                        Text("그만하기")
                        .padding(.init(top: 16, leading: 45, bottom: 16, trailing: 45))
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .font(.system(size:18, weight: .semibold))
                        .foregroundColor(.black)
                    })
                    .padding(.leading)
                    .padding(.trailing, 5)
                    
                    Button(action: {isGameOver = false}, label:{
                        Text("다시 도전")
                            .padding(.init(top: 16, leading: 45, bottom: 16, trailing: 45))
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .font(.system(size:18, weight: .semibold))
                        .foregroundColor(.white)
                    })
                    .padding(.leading, 5)
                    .padding(.trailing)
                }
                .padding(.bottom, 60.0)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Ending_Previews: PreviewProvider {
    static var previews: some View {
        Ending(isGameStarted: .constant(false), isGameOver: .constant(false))
    }
}
