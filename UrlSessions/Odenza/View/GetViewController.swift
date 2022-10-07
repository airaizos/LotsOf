//
//  GetViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 7/9/22.
//
//TODO: No ejecuta urlSession
import UIKit

final class GetViewController: UIViewController {
    var viewModel = OdenzaViewModel()
    
    var idLabel: UILabel = {
        let label = UILabel()
        label.text = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var bodyLabel: UILabel = {
        let label = UILabel()
        label.text = "body"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews:[idLabel, titleLabel, bodyLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.retrievePosts()
        getPost()
    }
    
    func setupView() {
        view.backgroundColor = .systemTeal
        view.addSubview(postStackView)
        NSLayoutConstraint.activate([
            
            postStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            postStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func getPost() {
        #warning("Index out of range")
        print(viewModel.items[0])
        idLabel.text = "\(String(describing: viewModel.items[0].id))"
        titleLabel.text = viewModel.items[0].title
        bodyLabel.text = viewModel.items[0].body
    }
}
