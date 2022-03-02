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
    @State private var currentScoreInt:Int = 0
    @State private var showingAlert:Bool = false
    @State private var finalResult:String = ""

    
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
            currentMessage = "Computer chose \(computerChoice). It's a tie"
        } else if computerChoice == "rock" && playerChoice == "scissors" || computerChoice == "paper" && playerChoice == "rock" || computerChoice == "scissors" && playerChoice == "paper" {
            currentMessage = "Computer chose \(computerChoice). Computer wins this time"
            currentScoreInt -= 1
        } else {
            currentMessage = "Computer chose \(computerChoice). You won this time"
            currentScoreInt += 1
        }
    }
    
    func checkWinner() {
        if currentScoreInt == 2 {
            finalResult = "You won with a score of 2" // in how many rounds
            showingAlert = true
            currentScoreInt = 0
        } else if currentScoreInt == -2 {
            finalResult = "You lost with a score of -2" // in how many rounds
            showingAlert = true
            currentScoreInt = 0

        }
    }
    
    
    var body: some View {
        NavigationView{
            VStack {
                Section{
                    Text(String(currentScoreInt))
                }
                Section {
                    HStack {
                        Button {
                            makePlayerChoice(choice: "rock")
                            makeComputerChoice()
                            checkResult()
                            checkWinner()
                        } label: {
                            Text("Rock")
                        }.buttonStyle(.bordered)
                        Button {
                            makePlayerChoice(choice: "paper")
                            makeComputerChoice()
                            checkResult()
                            checkWinner()
                        } label: {
                            Text("Paper")
                        }.buttonStyle(.bordered)
                        Button {
                            makePlayerChoice(choice: "scissors")
                            makeComputerChoice()
                            checkResult()
                            checkWinner()
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
        .alert("Game finished. \(finalResult)", isPresented: $showingAlert) {
            Button("Play again") {}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
