import SwiftUI

struct ContentView : View {
    var emoji = ["🥃" , "🥹 ", "👨🏿‍🏫" , "😙" ,"💪" , "🚗" , "🚒" , "🛵" , "⛴️"]
    @State var cardcount = 4
    var body : some View {
        Text("Memorize !")
            .font(.largeTitle)
        VStack{
            ScrollView{
                cards}
            Spacer()
            cardadjuster
        }.padding()
    }
    
    
    
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum : 100))]){
            ForEach(0..<cardcount , id : \.self){index in
                CardView(content: emoji[index])
                    .aspectRatio(3/4 , contentMode : .fit)
            }
        }.foregroundColor(.red)
    }
    
    
    func cardcountadjuster(by offset : Int , symbol : String) -> some View{
        Button(action : {cardcount += offset} ,
               label : {Image(systemName: symbol)
        }
        ).disabled(cardcount + offset > emoji.count  || cardcount + offset <= 0)
    }
    
    var cardadder : some View{
        cardcountadjuster(by: 1, symbol: "doc.fill.badge.plus")
    }
    var cardremover : some View {
        cardcountadjuster(by: -1, symbol: "minus.circle.fill")
    }
    var cardadjuster : some View{
        HStack{
            cardadder
            Spacer()
            cardremover
        }
        
    }
}



struct CardView : View{
    let content : String
    @State var isfaceup = true
    var body : some View{
        ZStack{
            @State var base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            }
            .opacity(isfaceup ? 1 : 0)
            base.fill().opacity(isfaceup ? 0 : 1)
        }.onTapGesture{
            isfaceup.toggle()
        }
    }
}

#Preview {
    ContentView()
}


