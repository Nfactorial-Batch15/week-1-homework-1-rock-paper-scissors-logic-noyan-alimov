//
//  utils.swift
//  rock_paper_scissors
//
//  Created by Noyan Alimov on 30/11/2021.
//

import Foundation

func getPlayerNames() throws -> [String] {
    print("Enter player 1 name:")
    let player1NameOptional = readLine()
    
    print("Enter player 2 name:")
    let player2NameOptional = readLine()
    
    if let player1Name = player1NameOptional, let player2Name = player2NameOptional {
        return [player1Name, player2Name]
        
    }
    
    throw GameError.noNames
}

func getShape(strShape: String) throws -> Shape {
    switch strShape {
        case "1": return .rock
        case "2": return .paper
        case "3": return .scissors
        default: throw GameError.invalidShape
    }
}

func getPlayerShapes() throws -> [Shape] {
    print("Please enter number to choose a shape")
    print("Rock - 1")
    print("Paper - 2")
    print("Scissors - 3")
    
    print("Enter player 1 shape:")
    let player1ShapeOptional = readLine()
    
    print("Enter player 2 shape:")
    let player2ShapeOptional = readLine()
    
    if let player1Shape = player1ShapeOptional, let player2Shape = player2ShapeOptional {
        do {
            let shape1 = try getShape(strShape: player1Shape)
            let shape2 = try getShape(strShape: player2Shape)
            return [shape1, shape2]
        } catch {
            throw error
        }
    }
    
    throw GameError.noShapes
}

func unwrapShape(shape: Shape?) throws -> Shape {
    guard let shape = shape else { throw GameError.unwrapShapeError }
    return shape
}

func getWinner(player1: PlayerProtocol, player2: PlayerProtocol) throws -> String {
    do {
        let shape1 = try unwrapShape(shape: player1.shape)
        let shape2 = try unwrapShape(shape: player2.shape)
        
        if shape1 > shape2 {
            return player1.name
        } else if shape1 < shape2 {
            return player2.name
        } else {
            return "Draw"
        }
    } catch {
        throw error
    }
}

func getYesOrNo(value: String) throws -> Bool {
    switch value {
        case "yes": return true
        case "no": return false
        default: throw GameError.invalidInputForPlayAgain
    }
}

func playAgain() throws -> Bool {
    print("Would you like to play again?")
    print("Please type 'yes' or 'no'")
    
    let isPlayAgainOptional = readLine()
    
    if let isPlayAgain = isPlayAgainOptional {
        do {
            return try getYesOrNo(value: isPlayAgain)
        } catch {
            throw error
        }
    }
    
    throw GameError.errorPlayAgainReadLine
}
