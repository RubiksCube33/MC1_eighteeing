import SwiftUI

struct ModalView: View {
    @Binding var isShowing: Bool
    @Binding var name: String
    @Binding var description: String
    @Binding var image: String
    
    @State private var isDragging = false
    @State private var curHeight: CGFloat = 600
    let minHeight: CGFloat = 500
    let maxHeight: CGFloat = 700
    let startOpacity: Double = 0.4
    let endOpacity: Double = 0.8
    
    var dragPercentage: Double{
        let res = Double((curHeight - minHeight)/(maxHeight-minHeight))
        return max(0, min(1,res))
    }
    var body: some View {
        ZStack (alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(startOpacity+(endOpacity-startOpacity)*dragPercentage)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                mainView
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(isDragging ? nil : .easeInOut(duration: 0.45))
   
    }
    var mainView: some View{
        VStack {
            ZStack{
                Capsule()
                    .frame(width: 80, height: 6)
                    .foregroundColor(.black)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
//            .background(Color.white.opacity(0.75))
            .gesture(dragGesture)
            
            ZStack{
                VStack(alignment: .center){
                    Text(name)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.top, 30)
                    
                    Spacer()
                    Image(image)
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    Text(description)
                        .font(.system(size: 18))
                        .foregroundColor(.black.opacity(0.7))
                        
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 30)
                }
                .padding(.horizontal, 30)
            }
            .frame(maxHeight: .infinity)
            .padding(.bottom, 35)
        }
        .frame(height: curHeight)
        .frame(maxWidth: .infinity)
        .background(
           
            ZStack{
                
             
                Blur(style: .systemUltraThinMaterial).cornerRadius(50)
                RoundedRectangle(cornerRadius: 50).opacity(0.75)
               
            }
            
            
        ).foregroundColor(.white)
    }
    
    @State private var prevDragTranslation = CGSize.zero
    
    var dragGesture: some Gesture {
        DragGesture (minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                if !isDragging {
                    isDragging = true
                }
                let dragAmount = val.translation.height - prevDragTranslation.height
                if curHeight > maxHeight || curHeight < minHeight {
                    curHeight -= dragAmount / 6
                } else {
                    curHeight -= dragAmount
                }
                prevDragTranslation = val.translation
            }
            .onEnded { val in
                prevDragTranslation = .zero
                isDragging = false
                if curHeight > maxHeight{
                    curHeight = maxHeight
                } else if curHeight < minHeight {
                    curHeight = minHeight
                }
            }
    }
}

//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalView(isShowing: $isShowing, name: $name, description: $description, image: $image)
//    }
//}
struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
