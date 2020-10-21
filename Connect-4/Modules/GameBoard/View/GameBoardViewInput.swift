//
//  GameBoardInput.swift
//  Connect-4
//
//  Created by Meitar Basson on 21/10/2020.
//

protocol GameBoardViewInput: class {
    func calculateCircleWidthHeight()
    func calculateLeftRightGap()
    func calculateBetweenCirclesGap()
    func calculateTopBottomGap()
}
