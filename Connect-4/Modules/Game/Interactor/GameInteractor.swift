//
//  GameInteractor.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

import UIKit

final class GameInteractor: GameInteractorInput {
    
    weak var presenter: GamePresenterInput?
    
    func tryAddNewCoin(atX x: Float, boardState: [[Circle]], boardStats: BoardSizes) {
        guard let circleWidthHeight = boardStats.circleWidthHeight,
              let coinIndex = getCoinIndexXY(boardState: boardState,
                                           boardStats: boardStats, atX: x),
              let yPos = getCoinY(yIndex: coinIndex.1, boardStats: boardStats),
              let xPos = getCoinX(xIndex: coinIndex.0, boardStats: boardStats)
        else { return }
        
        let circleFrame = CGRect(x: CGFloat(xPos), y: CGFloat(yPos),
                                 width: circleWidthHeight, height: circleWidthHeight)
        
        var board = boardState
        board[coinIndex.0].append(Circle(frame: circleFrame, color: .green,
                                                 radius: circleWidthHeight / 2))
        presenter?.addedCoinSuccessfuly(atX: xPos, atY: yPos, board: board)
    }
    
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
}
