//
//  models.swift
//  rock_paper_scissors
//
//  Created by Noyan Alimov on 30/11/2021.
//

import Foundation

enum Shape: String {
    case rock = "rock"
    case paper = "paper"
    case scissors = "scissors"
}

enum GameError: Error {
    case noNames
    case noShapes
    case invalidShape
    case errorPlayAgainReadLine
    case invalidInputForPlayAgain
}

protocol PlayerProtocol {
    var name: String { get }
    var shape: Shape? { get set}
}

struct Player : PlayerProtocol {
    var name: String
    var shape: Shape?
}
