//
//  main.swift
//  rock_paper_scissors
//
//  Created by Noyan Alimov on 30/11/2021.
//

import Foundation

func playGame() {
    print("Welcome to Rock Paper Scissors game!")
   
    do {
        let names = try getPlayerNames()
        var player1 = Player(name: names[0])
        var player2 = Player(name: names[1])
        
        let shapes = try getPlayerShapes()
        player1.shape = shapes[0]
        player2.shape = shapes[1]
        
        let winner = try getWinner(player1: player1, player2: player2)
        
        print("Winner is \(winner)")
        
        let isPlayAgain = try playAgain()
        
        if isPlayAgain {
            playGame()
        } else {
            print("Good bye!")
        }
    } catch {
        print(error)
    }
}

playGame()
