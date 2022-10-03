//
//  ChaseButtonViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 28/9/22.
//

import Foundation
import UIKit

final class ChaseButtonViewController: UIViewController {
    
    var viewWidth: CGFloat = 300
    var viewHeight: CGFloat = 700
    var buttonLeadingPosition: CGFloat = 10
    var buttonTopPosition: CGFloat = 10
    var timesTapped = 0
    var totalTimeReaction: TimeInterval = 0.0
    var timeReaction: TimeInterval = 0.0
    
    var buttonLeadingConstraint: NSLayoutConstraint?
    var buttonTopConstraint: NSLayoutConstraint?
    
    private lazy var chaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("TapMe", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()
    
    var timesTappedLabel: UILabel = {
        let label = UILabel()
        label.text = "Cero"
        label.textColor = .systemGray3
        label.font = UIFont.systemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func viewDidLoad() {
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(chaseButton)
        view.addSubview(timesTappedLabel)
        timesTappedLabel.isHidden = false
        timesTappedLabel.text = "\(timesTapped)"
        //timesTappedLabel.isHidden = true
        
        chaseButton.frame = .init(x: 0, y: 0, width: 44, height: 44)
        buttonLeadingConstraint = chaseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.random(in: 0...viewHeight))
        print("h:\(viewHeight) W:\(viewWidth)")
        buttonTopConstraint = chaseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat.random(in: 0...viewHeight))
        
        NSLayoutConstraint.activate([
            buttonLeadingConstraint!, buttonTopConstraint!,
            
            timesTappedLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            timesTappedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    func setupViewBounds() {
        //cuanto mide la vista
        //852 //393
    }
    
    
    @objc private func buttonTapped(sender: UIButton) {
        timesTapped += 1
        randomConstraints()
        UIView.animate(withDuration: 0.1) {
            self.buttonLeadingConstraint?.constant = self.buttonLeadingPosition
            self.buttonTopConstraint?.constant = self.buttonTopPosition
            self.view.layoutIfNeeded()
        }
        if timesTapped % 3 == 0 {
    //        showTimesTapped()
        }
        
        // mover el botón a una posicionar aleatoria
        //poner el tiempo que he tardado en pulsar
        //recargar la vista
        
    }
    
    func randomConstraints() {
        buttonLeadingPosition = CGFloat.random(in: 0...viewWidth)
        buttonTopPosition = CGFloat.random(in: 0...viewHeight)
    }
    
    func showTimesTapped() {
        self.timesTappedLabel.isHidden = false
        UIView.animate(withDuration: 1
                       /*,
                       delay: 0,
                       usingSpringWithDamping: 0.25,
                       initialSpringVelocity: 0.25,
                       options: .curveEaseInOut
                        */) {
          //  DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               //TODO: NO SE MUESTRA EL LABEL
                self.timesTappedLabel.text = "\(self.timesTapped)"
                self.view.layoutIfNeeded()
             
            }//
        timesTappedLabel.isHidden = true
        }
      
    
}
