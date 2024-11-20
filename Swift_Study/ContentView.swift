
import SwiftUI

struct ContentView: View {
    let emoji = ["👻", "☠️", "👿", "🥳", "👾"]
    var body: some View  {
        HStack {
            ForEach(emoji.indices , id : \.self){index in
                CardView(content : emoji[index])
            }
        }.foregroundColor(.mint)
    }
}
 
#Preview {
    ContentView()
}
  

struct CardView : View{
    let content : String
    @State var isFaceup = false
    var body : some View{
        ZStack() {
            @State var base = RoundedRectangle(cornerRadius: 12)
            if isFaceup{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            }
            else{
                base.fill()
            }
        }.onTapGesture {
            isFaceup.toggle()
        }
    }
}
