//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

import UIKit
import SnapKit

class GameViewController: BaseViewController {
    
    var presenter: GamePresenterProtocol?

    private lazy var gameBoard: Board = {
        let board = Board(frame: .zero)
        return board
    }()
    
    private lazy var player1ImageView: UIImageView = {
        let imgView = UIImageView(frame: .zero)
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "bluePerson")
        imgView.snp.makeConstraints { (make) in
            make.height.equalTo(60)
        }
        return imgView
    }()
    
    private lazy var player1Title: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont(name: "Montserrat-Bold", size: 16)
        label.text = "Player 1"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var player1Stack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [player1ImageView, player1Title])
         sv.distribution = .equalCentering
         sv.spacing = 8
         sv.axis = .horizontal
         return sv
    }()
    
    private lazy var player2ImageView: UIImageView = {
        let imgView = UIImageView(frame: .zero)
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "redPerson")
        imgView.snp.makeConstraints { (make) in
            make.height.equalTo(60)
        }
        return imgView
    }()
    
    private lazy var player2Title: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont(name: "Montserrat-Bold", size: 16)
        label.text = "Player 2"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var player2Stack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [player2ImageView, player2Title])
         sv.distribution = .equalCentering
         sv.spacing = 8
         sv.axis = .horizontal
         return sv
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        print("Appear")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setUpUI()
        makeConstraints()
    
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(getPoint))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLayoutSubviews() {
        gameBoard.calculateCircleWidthHeight()
        presenter?.boardStats = gameBoard.boardSizes
        presenter?.controller = self
    }
    
    override func setUpUI() {
        super.setUpUI()
        self.view.addSubview(gameBoard)
        self.view.addSubview(player1Stack)
        self.view.addSubview(player2Stack)
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        self.gameBoard.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(self.gameBoard.snp.width).multipliedBy(0.883)
        }
        
        self.player1Stack.snp.makeConstraints { (make) in
            make.leading.equalTo(gameBoard.snp.leading)
            make.bottom.equalTo(gameBoard.snp.top).inset(-24)
            make.width.equalTo(100)
            make.height.equalTo(60)
        }
        
        self.player2Stack.snp.makeConstraints { (make) in
            make.trailing.equalTo(gameBoard.snp.trailing)
            make.bottom.equalTo(gameBoard.snp.top).inset(-24)
            make.width.equalTo(100)
            make.height.equalTo(60)
        }
    }

    @objc func getPoint(gestureRecognizer: UITapGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizer.State.recognized
        {
            let location = gestureRecognizer.location(in: gestureRecognizer.view)
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
        
    private func animateNewCoin(x: Float, yMax: Float, coin: Circle) {
        UIView.animate(withDuration: 1.0) {
            coin.frame.origin = CGPoint(x: CGFloat(x), y: CGFloat(yMax))
        } completion: { _ in }
    }
}

extension GameViewController: GameViewInputGF {
    func resetBoard() {
        presenter?.resetBoard()
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
        
        presenter?.viewDidLoad()
        setUpUI()
        makeConstraints()
    }
}
