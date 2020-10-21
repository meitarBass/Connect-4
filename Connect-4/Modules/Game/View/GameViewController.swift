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
        self.view.backgroundColor = .white
        
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
            presenter?.handleBoardTap(atX: Float(location.x), atY: Float(location.y))
        }
    }

}

extension GameViewController: GameViewInput {
    func addNewCoin(frame: (x: Float, y: Float, width: Float, height: Float)) {
        let location = CGPoint(x: CGFloat(frame.x), y: CGFloat(frame.y))
        let size = CGSize(width: CGFloat(frame.width), height: CGFloat(frame.height))
        
        let coin = Circle(frame: CGRect(origin: location, size: size),
                          color: .green,
                          radius: size.width / 2)
        self.view.addSubview(coin)
    }
    
    func resetBoard() {
        
    }
}
