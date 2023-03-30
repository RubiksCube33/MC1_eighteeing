//
//  GamePlayView.swift
//  
//
//  Created by 김하은 on 2023/03/30.
//

import SwiftUI

struct GamePlayView: View {
    @Binding var isGameStarted: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("옆으로 스와이프 해서 루빅룩을 골라주세요!")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.top, 70.0)
                    Image("룹기_어두운1")
                        .resizable()
                        .frame(width: 340.0, height: 550.0)
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, -50.0)
                    NavigationLink (destination:
                        GameResultView( isGameStarted: $isGameStarted)){
                        Text("제 픽은 이거에요!")
                            .padding(.init(top: 20, leading: 108, bottom: 20, trailing: 108))
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct GamePlayView_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayView(isGameStarted: .constant(false))
    }
}
