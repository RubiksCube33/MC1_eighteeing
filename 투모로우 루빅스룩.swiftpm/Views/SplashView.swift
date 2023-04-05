import SwiftUI

struct SplashView: View {
    
    @State var splashTimer = false
    
    var body: some View {
        NavigationView(){
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 352)
                
                Spacer()
                Text("Made by 애잇팅!").foregroundColor(.gray)
                NavigationLink(destination:OB1View(),isActive: $splashTimer){
                    
                }
            }
        }.navigationBarBackButtonHidden(true)
            /*.onAppear{
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                    splashTimer = true
                }
            }*/
    }
}


struct SplashView_Previews: PreviewProvider {
  static var previews: some View {
      SplashView()
  }
}
