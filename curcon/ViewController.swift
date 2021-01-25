//
//  ViewController.swift
//  curcon
//
//  Created by Bahadır Enes Atay on 16.01.2021.
//

import UIKit

class ViewController: UIViewController {

    var gbpToTryLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var usdToTryLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var eurToTryLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    let tryToGbpLabel = UILabel()
    let tryToUsdLabel = UILabel()
    let tryToEurLabel = UILabel()

    override func loadView() {
        super.loadView()
        setUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillCurrencyLabel()
    }
    
    var apiManager: ApiManager!
    func fillCurrencyLabel() {
        apiManager = ApiManager()
        apiManager.getCurrencyData { (currencyViewModel) in
            self.gbpToTryLabel.text = "\(currencyViewModel.gbpAsBase) £"
            self.tryToGbpLabel.text = "\(currencyViewModel.gbpToTry) ₺"
            self.usdToTryLabel.text = "\(currencyViewModel.usdAsBase) $"
            self.tryToUsdLabel.text = "\(currencyViewModel.usdToTry) ₺"
            self.eurToTryLabel.text = "\(currencyViewModel.eur) €"
            self.tryToEurLabel.text = "\(currencyViewModel.tr) ₺"
        } onError: { (error) in
            self.setErrorAlert(error: error)
        }
    }
    
    func setErrorAlert(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    func setUI() {
        gbpToTryLabel.setLabel()
        usdToTryLabel.setLabel()
        eurToTryLabel.setLabel()
        
        tryToGbpLabel.setLabel()
        tryToUsdLabel.setLabel()
        tryToEurLabel.setLabel()
        
        let gbpStack = UIStackView()
        gbpStack.setupCustomStackView(arrangedSubviewArray: [gbpToTryLabel, tryToGbpLabel], axis: .horizontal, spacing: 20, topSpace: 10, leftSpace: 10, bottomSpace: 10, rightSpace: 10)
        let usdStack = UIStackView()
        usdStack.setupCustomStackView(arrangedSubviewArray: [usdToTryLabel, tryToUsdLabel], axis: .horizontal, spacing: 20, topSpace: 10, leftSpace: 10, bottomSpace: 10, rightSpace: 10)
        let eurStack = UIStackView()
        eurStack.setupCustomStackView(arrangedSubviewArray: [eurToTryLabel, tryToEurLabel], axis: .horizontal, spacing: 20, topSpace: 10, leftSpace: 10, bottomSpace: 10, rightSpace: 10)
        gbpStack.addBackground(color: .white, shadowColor: .black, borderColor: .clear, shadowOpacity: 0.2, shadowRadius: 20, cornerRadius: 20, alpha: 1)
        usdStack.addBackground(color: .white, shadowColor: .black, borderColor: .clear, shadowOpacity: 0.2, shadowRadius: 20, cornerRadius: 20, alpha: 1)
        eurStack.addBackground(color: .white, shadowColor: .black, borderColor: .clear, shadowOpacity: 0.2, shadowRadius: 20, cornerRadius: 20, alpha: 1)
        
        let stackView = UIStackView()
        stackView.setupCustomStackView(arrangedSubviewArray: [gbpStack, usdStack, eurStack], axis: .vertical, spacing: 20, topSpace: 50, leftSpace: 10, bottomSpace: 50, rightSpace: 10)
        stackView.distribution = .fillEqually
        stackView.addBackground(color: .white, shadowColor: .clear, borderColor: .clear, shadowOpacity: 0, shadowRadius: 0, cornerRadius: 0, alpha: 1)
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}
