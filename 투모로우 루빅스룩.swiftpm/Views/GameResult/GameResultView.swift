//
//  GameResultView.swift
//  
//
//  Created by 김하은 on 2023/03/29.
//

import SwiftUI

struct GameResultView: View {
    
    @Binding var isGameStarted: Bool
    @Binding var isGameOver : Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("루빅이 입은 모습이예요 😎")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.top, 70.0)
                    Image("룹기_어두운1")
                        .resizable()
                        .frame(width: 340.0, height: 550.0)
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, -50.0)
                    NavigationLink {
                        Ending(isGameStarted: $isGameStarted, isGameOver: $isGameOver)
                    } label: {
                        Text("내일의 루빅룩 확정!")
                            .padding(.init(top: 20, leading: 108, bottom: 20, trailing: 108))
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    Button(action: {isGameOver = false}, label:{
                        Text("다시 꾸며 볼래요")
                            .padding(.init(top: 11, leading: 0, bottom: 0, trailing: 0))
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                    }).padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                    
                    /*NavigationLink {
                        Ending(isGameStarted: $isGameStarted)
                    } label: {
                        Text("다시 꾸며 볼래요")
                            .padding(.init(top: 11, leading: 0, bottom: 0, trailing: 0))
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))*/
                    
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct GameResultView_Previews: PreviewProvider {
    static var previews: some View {
        GameResultView(isGameStarted: .constant(false), isGameOver: .constant(false))
    }
}
