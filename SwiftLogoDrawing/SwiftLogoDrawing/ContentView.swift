//
//  ContentView.swift
//  SwiftBirdDrawing
//
//  Created by Anup D'Souza on 27/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var percentage: CGFloat = 0
    @State private var fill = false
    
    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                Text("Swift Bird")
                    .foregroundColor(.white)
                SwiftBird()
                    .fill(Color.white)
                    .frame(width: 100, height: 100)
                
                Text("Swift Logo")
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color(uiColor: UIColor(red: 222.0/255.0, green: 97.0/255.0, blue: 67.0/255.0, alpha: 1.0)))
                    .frame(width: 100, height: 100)
                    .overlay {
                        SwiftBird()
                            .fill(Color.white)
                            .frame(width: 92, height: 92)
                    }
                
                Text("Swift Bird Animated")
                    .foregroundColor(.white)
                SwiftBird()
                    .fill(Color.white)
                    .opacity(percentage)
                    .frame(width: 100, height: 100)
                    .animation(.easeInOut(duration: 2.0), value: percentage)
                    .onAppear {
                        self.percentage = 1.0
                    }
                
                Text("Swift Bird Draw & Fill Animated")
                    .foregroundColor(.white)
                SwiftBird()
                    .trim(from: 0, to: percentage)
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
                    .frame(width: 100, height: 100)
                    .animation(.easeInOut(duration: 2.0), value: percentage)
                    .onAppear {
                        self.percentage = 1.0
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            fill.toggle()
                        }
                    }
                    .overlay {
                        SwiftBird()
                            .fill(Color.white)
                            .opacity(fill ? 1 : 0)
                            .animation(.linear, value: fill)
                    }
            }
            
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
