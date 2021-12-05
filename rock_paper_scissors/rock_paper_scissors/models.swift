//
//  models.swift
//  rock_paper_scissors
//
//  Created by Noyan Alimov on 30/11/2021.
//

import Foundation

enum Shape: String, Equatable, Comparable {
    case rock = "rock"
    case paper = "paper"
    case scissors = "scissors"
    
    static func == (lhs: Shape, rhs: Shape) -> Bool {
        switch (lhs, rhs) {
        case (.rock, .rock),
            (.paper, .paper),
            (.scissors, .scissors):
            return true
        default:
            return false
        }
    }
    
    static func < (lhs: Shape, rhs: Shape) -> Bool {
        switch (lhs, rhs) {
        case (.rock, .paper),
            (.paper, .scissors),
            (.scissors, .rock):
            return true
        default:
            return false
        }
    }
}

enum GameError: Error {
    case noNames
    case noShapes
    case invalidShape
    case errorPlayAgainReadLine
    case invalidInputForPlayAgain
    case unwrapShapeError
}

protocol PlayerProtocol {
    var name: String { get }
    var shape: Shape? { get set}
}

struct Player : PlayerProtocol {
    var name: String
    var shape: Shape?
}
