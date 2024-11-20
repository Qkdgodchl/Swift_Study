
import SwiftUI

struct ContentView: View {
    var body: some View  {
        HStack {
            CardView(isFaceup: true)
            CardView()
            CardView()
            CardView()
        }.foregroundColor(.mint)
    }
}
 
#Preview {
    ContentView()
}
  

struct CardView : View{
    @State var isFaceup = false
    var body : some View{
        ZStack() {
            @State var base = RoundedRectangle(cornerRadius: 12)
            if isFaceup{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("☠️")
            }
            else{
                base.fill()
            }
        }.onTapGesture {
            isFaceup.toggle()
        }
    }
}
