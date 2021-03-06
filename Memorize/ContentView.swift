//
//  ContentView.swift
//  Memorize
//
//  Created by ææĢŪ on 2021/8/14.
//

import SwiftUI


struct ContentView: View {
    var emojis = [ "ðģ", "ð", "ðŽ", "ðĶ­", "ð", "ð ", "ðĄ", "ðĶ", "ð", "ð", "ð", "ðĶ", "ð", "ðĢ", "ðĪ", "ðĨ", "ðĶ", "ð§", "ðïļ", "ðĶ", "ðĶ", "ðĶĒ", "ðĶ", "ðĶĪ", "ðŠķ", "ðĶĐ", "ðĶ", "ðĶ", "ðļ", "ð", "ðĒ", "ðĶ", "ð", "ðē", "ð", "ðĶ", "ðĶ"]
    @State var emojisCount : Int = 12
    
    var body: some View{
        VStack{
            HStack{
                Text("Memorize!")
                    .font(.title)
                    .foregroundColor(.black)
            }
            ScrollView{
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 70, maximum: 80))],
                    content: {
                        ForEach(emojis[0..<emojisCount], id: \.self){
                            emoji in CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                )
            }
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }

    var remove: some View{
        Button(action: {
            if emojisCount > 1 {
                emojisCount -= 1
            }
        }, label:{
            Image(systemName: "minus.circle")
                .font(.largeTitle)
        })
        .foregroundColor(.blue)
    }
    var add: some View{
        Button(action: {
            if emojisCount < emojis.count {
                emojisCount += 1
            }
        }, label:{
            Image(systemName: "plus.circle")
                .font(.largeTitle)
        })
        .foregroundColor(.blue)
    }
}

struct CardView: View {
    var content : String
    @State var isFaceUp : Bool = true
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
