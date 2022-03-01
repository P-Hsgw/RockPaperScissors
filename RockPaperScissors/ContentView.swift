//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Patryk Hasegawa on 2022/03/01.
//

import SwiftUI

struct ContentView: View {
    var moves = ["rock", "paper", "scissors"]
    @State private var currentChoice: String = "Test"
    @State private var shouldWin: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Button {
                    // Function goes here
                } label: {
                    Text("Rock")
                    
                }.buttonStyle(.bordered)
                Button {
                    // Function goes here
                } label: {
                    Text("Paper")
                }.buttonStyle(.bordered)
                Button {
                    // Function goes here
                } label: {
                    Text("Scissors")
                }.buttonStyle(.bordered)
            }
            TextField("Current Choice", text:$currentChoice)
            Spacer()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
