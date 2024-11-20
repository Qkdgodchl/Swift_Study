
import SwiftUI

struct ContentView: View {
    var body: some View  {
        HStack {
            CardView(isFaceup: true)
            CardView()
            CardView()
            CardView()
        }
    }
}
 
#Preview {
    ContentView()
}
  

struct CardView : View{
    var isFaceup = false
    var body : some View{
        ZStack() {
            if isFaceup{
                RoundedRectangle(cornerRadius:12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius:12)
                    .strokeBorder(lineWidth: 2)
                Text("☠️")
            }
            else{
                RoundedRectangle(cornerRadius: 12)
            }
        }.foregroundColor(.mint)
    }
}
