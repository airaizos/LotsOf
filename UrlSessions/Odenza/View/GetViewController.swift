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
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.font = .preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    var bodyLabel: UILabel = {
        let label = UILabel()
        label.text = "body"
        label.font = .preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
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
        bind()
        
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
    
    func bind() {
        viewModel.refreshData = {
            DispatchQueue.main.async {
                self.getPost()
            }
        }
    }
    
    func getPost() {
        guard let item = viewModel.items.first else { return }
        idLabel.text = "\(item.id!)"
        titleLabel.text = item.title
        bodyLabel.text = item.body
    }
    deinit {
        print("    [DEINIT] ->      GetViewController")
    }
}
