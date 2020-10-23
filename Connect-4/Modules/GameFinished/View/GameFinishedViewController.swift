//
//  GameFinishedView.swift
//  Connect-4
//
//  Created by Meitar Basson on 24/10/2020.
//

import UIKit
import SnapKit

class GameFinishedViewController: BaseViewController {
    
    private lazy var playerImageView: UIImageView = {
        let imgView = UIImageView(frame: .zero)
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var winnerTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont(name: "Montserrat-Bold", size: 28)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var playAgainButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
        button.setTitle("Play Again", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8.0
        button.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 20)
        button.setTitleColor(.black, for: .normal)
        
        button.snp.makeConstraints { (make) in
            make.height.equalTo(60)
        }
        return button
    }()
    
    private lazy var stackView: UIStackView = {
       let sv = UIStackView(arrangedSubviews: [winnerTitle, playerImageView, playAgainButton])
        sv.distribution = .equalCentering
        sv.spacing = 8
        sv.axis = .vertical
        return sv
    }()
    
    var winningPlayer: Player!
    var delegate: GameViewInputGF?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        makeConstraints()
    }
    
    override func setUpUI() {
        super.setUpUI()
        self.view.addSubview(stackView)
        setUpWinnerImage()
    }
    
    private func setUpWinnerImage() {
        guard let winner = winningPlayer.type else { return }
        switch winner {
        
        case .computer:
            playerImageView.image = UIImage(named: "redPerson")
            winnerTitle.text = "Player 2 Won"
        case .human:
            playerImageView.image = UIImage(named: "bluePerson")
            winnerTitle.text = "Player 1 Won"
        }
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        self.stackView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    
    @objc func playAgain() {
        delegate?.resetBoard()
        self.dismiss(animated: true, completion: nil)
    }
    
}
