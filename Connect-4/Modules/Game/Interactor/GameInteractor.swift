//
//  GameInteractor.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

import UIKit

final class GameInteractor: GameInteractorInput {
    
    weak var presenter: GamePresenterInput?
    
    func tryAddNewCoin(atX x: Float, boardState: [[Circle]], boardStats: BoardSizes, player: Player) {
        guard let circleWidthHeight = boardStats.circleWidthHeight,
              let coinIndex = getCoinIndexXY(boardState: boardState,
                                           boardStats: boardStats, atX: x),
              let yPos = getCoinY(yIndex: coinIndex.1, boardStats: boardStats),
              let xPos = getCoinX(xIndex: coinIndex.0, boardStats: boardStats)
        else { return }
        
        let circleFrame = CGRect(x: CGFloat(xPos), y: CGFloat(yPos),
                                 width: circleWidthHeight, height: circleWidthHeight)
        
        var board = boardState
        var player = player
        player.getColor()
        
        guard let color = player.color else { return }
        
        board[coinIndex.0].append(Circle(frame: circleFrame, color: color,
                                                 radius: circleWidthHeight / 2))
        presenter?.addedCoinSuccessfuly(atX: xPos, atY: yPos, board: board, coinIndex: (coinIndex.0, coinIndex.1))
    }
    
    func checkIfSomeoneWon(board: [[Circle]], lastCoinIndex: (x: Int, y: Int)) -> Bool {
        
        var didSomeoneWin = false
        
        // MARK: Check for winning row
        var row: [Circle] = [Circle]()
        for column in board {
            if column.count - 1 >= lastCoinIndex.y {
                row.append(column[lastCoinIndex.y])
            }
        }
        
        didSomeoneWin = checkRow(row: row)
        
        // MARK: Check for winning Column
        didSomeoneWin = checkColumn(column: board[lastCoinIndex.x])
        
        print(didSomeoneWin)
        
        return didSomeoneWin
    }
}

extension GameInteractor {
    private func getCoinIndexXY(boardState: [[Circle]], boardStats: BoardSizes,
                              atX x: Float) -> (Int, Int)? {
        guard let circleWidthHeight = boardStats.circleWidthHeight,
              let circleGap = boardStats.circlesGap,
              let leftRightGap = boardStats.leftRightGap
        else { return nil }
        
        let indexX = Int((CGFloat(x) - leftRightGap - boardStats.imageGapSides) / (circleGap + circleWidthHeight))
        let indexY = boardState[Int(indexX)].count
        
        if indexY < 6 {
            return (Int(indexX), indexY)
        }
        
        return nil
    }
    
    private func getCoinY(yIndex: Int, boardStats: BoardSizes) -> Float? {
        guard let minY = boardStats.imageGapTopBottom,
              let circleGap = boardStats.circlesGap,
              let circleWidthHeight = boardStats.circleWidthHeight,
              let topBottomGap = boardStats.topBottomGap
        else { return nil }
        
        let yPos = minY - topBottomGap - circleWidthHeight -
            (circleGap + circleWidthHeight) * CGFloat(yIndex)
        return Float(yPos)
    }
    
    private func getCoinX(xIndex: Int, boardStats: BoardSizes) -> Float? {
        guard let leftRightGap = boardStats.leftRightGap,
              let circleSize = boardStats.circleWidthHeight,
              let circleGap = boardStats.circlesGap
        else { return nil }
        
        let xPos = boardStats.imageGapSides + leftRightGap + (circleGap + circleSize) * CGFloat(xIndex)
        return Float(xPos)
    }
    
    private func checkRow(row: [Circle]) -> Bool {
        var countIdenticalCoins = 0
        for (index, _) in row.enumerated() {
            if index < row.count - 1 {
                if row[index].returnColor() == row[index + 1].returnColor() {
                    countIdenticalCoins += 1
                } else {
                    countIdenticalCoins = 0
                }
            }
        }
        
        if countIdenticalCoins >= 3 {
            return true
        } else {
            return false
        }
    }
    
    private func checkColumn(column: [Circle]) -> Bool {
        
        // MARK: Not enough coins to win
        if column.count < 4 {
            return false
        }
        
        var countIdenticalCoins = 0
        for (index, _) in column.enumerated() {
            if index < column.count - 1 {
                if column[index].returnColor() == column[index + 1].returnColor() {
                    countIdenticalCoins += 1
                } else {
                    countIdenticalCoins = 0
                }
            }
        }
        
        if countIdenticalCoins >= 3 {
            return true
        } else {
            return false
        }
    }
}
