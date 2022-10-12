//
//  UsersCollectionViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 15/9/22.
//

import UIKit
//TODO: ¿Porqué tengo que dar a refresh para que se muestran los datos?
final class UsersCollectionViewController: UIViewController {
    var viewModel = UserViewModel()
    private let radius: CGFloat = 8.0
    private let cellIdentifier = "userCell"
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var usersLabel: UILabel!
    
    @IBOutlet weak var usersCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: ¿Porqué tengo que dar a refresh para que se muestran los datos?
        viewModel.fetchUsers()
        setupView()
        setupCollectionView()
    }
    
    private func setupView() {
        usersLabel.layer.cornerRadius = radius
        usersCollectionView.layer.cornerRadius = radius
        usersCollectionView.reloadData()
        usersLabel.text = "Users List"
        activityIndicator.startAnimating()
        bind()
    }
    
    private func bind() {
        viewModel.refreshData = { [weak self] in
            DispatchQueue.main.async {
                self?.usersCollectionView.reloadData()
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.isHidden = true
            }
        }
    }
    
    private func setupCollectionView() {
        usersCollectionView.delegate = self
        usersCollectionView.dataSource = self
        //MARK: ¿Cómo inicializar desde una Collection cell creada en el mismo storyboard?
        //    usersCollectionView.register(UserCell.self, forCellWithReuseIdentifier: cellIdentifier)
        usersCollectionView.register(UINib(nibName: "UserCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        
    }
    
    
    @IBAction func refreshCollectionView(_ sender: UIButton) {
        self.usersCollectionView.reloadData()
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        
    }
}

extension UsersCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.users[indexPath.row]
        
        guard let cell = usersCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? UserCell else { fatalError("No se puede cargar userCollectionCell")}
        cell.configure(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = viewModel.didSelectItem(at: indexPath)
        navigate(to: item)
    }
    
    func navigate(to item: UserModel) {
        DispatchQueue.main.async {
            let viewController = UserDetailViewModel().build(with: item)
            
            self.present(viewController, animated: true)
        }
    }
}
