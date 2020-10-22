//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

import UIKit
import SnapKit

class GameViewController: UIViewController {
    
    var presenter: GamePresenterProtocol?

    private lazy var gameBoard: Board = {
        let board = Board(frame: .zero)
        return board
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        makeConstraints()
    
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(getPoint))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLayoutSubviews() {
        gameBoard.calculateCircleWidthHeight()
        presenter?.boardStats = gameBoard.boardSizes
    }
    
    func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(gameBoard)
    }
    
    func makeConstraints() {
        self.gameBoard.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(self.gameBoard.snp.width).multipliedBy(0.883)
        }
    }

    @objc func getPoint(gestureRecognizer: UITapGestureRecognizer) {
        print("tap working")
        if gestureRecognizer.state == UIGestureRecognizer.State.recognized
        {
            let location = gestureRecognizer.location(in: gestureRecognizer.view)
            print(location.y)
            presenter?.handleBoardTap(atX: Float(location.x), atY: Float(location.y))
        }
    }

}

extension GameViewController: GameViewInput {
    func addNewCoin(frame: (x: Float, y: Float, width: Float, height: Float), color: UIColor) {
        guard let circleHeight = self.gameBoard.boardSizes.circleWidthHeight else { return }
        let yMin = self.gameBoard.frame.minY - circleHeight
        let location = CGPoint(x: CGFloat(frame.x), y: yMin)
        let size = CGSize(width: CGFloat(frame.width), height: CGFloat(frame.height))
        
        let coin = Circle(frame: CGRect(origin: location, size: size),
                          color: color,
                          radius: size.width / 2)
        self.view.insertSubview(coin, at: 0)
        animateNewCoin(x: frame.x, yMax: frame.y, coin: coin)
    }
    
    func resetBoard() {
        
    }
    
    private func animateNewCoin(x: Float, yMax: Float, coin: Circle) {
        UIView.animate(withDuration: 1.0) {
            coin.frame.origin = CGPoint(x: CGFloat(x), y: CGFloat(yMax))
        } completion: { _ in }
    }
}
