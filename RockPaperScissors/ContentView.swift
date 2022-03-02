//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Patryk Hasegawa on 2022/03/01.
//

import SwiftUI

struct ContentView: View {
    var moves = ["rock", "paper", "scissors"]
    @State private var currentChoice: String = ""
    @State private var shouldWin: Bool?
    
    func makePlayerChoice(choice: String) {
        currentChoice = choice.uppercased()
    }
    
    func makeComputerChoice() {
        let randomChoice = Int.random(in: 1...2)
        var choice: Bool?
        if randomChoice == 1 {
            choice = false
        } else if randomChoice == 2{
            choice = true
        }
        shouldWin = choice
    }
    
    
    
    var body: some View {
        NavigationView{
            VStack {
                Section {
                    HStack {
                        Button {
                            makePlayerChoice(choice: "rock")
                            makeComputerChoice()
                        } label: {
                            Text("Rock")
                        }.buttonStyle(.bordered)
                        Button {
                            makePlayerChoice(choice: "paper")
                        } label: {
                            Text("Paper")
                        }.buttonStyle(.bordered)
                        Button {
                            makePlayerChoice(choice: "scissors")
                        } label: {
                            Text("Scissors")
                        }.buttonStyle(.bordered)
                    }
                }header: {
                    Text("Chose your destiny")
                }
                Text(currentChoice)
                    .padding()
                Spacer()
                
            }
            .navigationTitle("Rock, Paper, Scissors")
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
