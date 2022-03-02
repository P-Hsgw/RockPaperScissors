//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Patryk Hasegawa on 2022/03/01.
//

import SwiftUI

struct ContentView: View {
    var moves = ["rock", "paper", "scissors"]
    @State private var playerChoice: String = ""
    @State private var computerChoice: String = ""
    @State private var shouldWin: Bool?
    @State private var currentMessage:String = ""
    
    func makePlayerChoice(choice: String) {
        playerChoice = choice
    }
    
    func makeComputerChoice() {
        let randomChoice = Int.random(in: 1...3)
        var choice: String = ""
        if randomChoice == 1 {
            choice = "rock"
        } else if randomChoice == 2{
            choice = "paper"
        } else if randomChoice == 3 {
            choice = "scissors"
        }
        computerChoice = choice
    }
    
    func checkResult() {
        if computerChoice == playerChoice {
            currentMessage = "It's a tie"
        } else if computerChoice == "rock" && playerChoice == "scissors" || computerChoice == "paper" && playerChoice == "rock" || computerChoice == "scissors" && playerChoice == "paper" {
            currentMessage = "Computer wins this time"
        } else {
            currentMessage = "You won this time"
        }
    }
    
    
    var body: some View {
        NavigationView{
            VStack {
                Section {
                    HStack {
                        Button {
                            makePlayerChoice(choice: "rock")
                            makeComputerChoice()
                            checkResult()
                        } label: {
                            Text("Rock")
                        }.buttonStyle(.bordered)
                        Button {
                            makePlayerChoice(choice: "paper")
                            makeComputerChoice()
                            checkResult()
                        } label: {
                            Text("Paper")
                        }.buttonStyle(.bordered)
                        Button {
                            makePlayerChoice(choice: "scissors")
                            makeComputerChoice()
                            checkResult()
                        } label: {
                            Text("Scissors")
                        }.buttonStyle(.bordered)
                    }
                }header: {
                    Text("Chose your destiny")
                }
                Text(currentMessage)
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
