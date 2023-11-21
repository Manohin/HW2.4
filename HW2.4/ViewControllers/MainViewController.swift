//
//  MainViewController.swift
//  HW2.4
//
//  Created by Alexey Manokhin on 20.11.2023.
//

import UIKit

final class MainViewController: UIViewController {
    let backgroundColor = UIColor(
        red: 0.175,
        green: 0.175,
        blue: 0.175,
        alpha: 1
    )
    
    lazy var titleLabel = {
        let label = UILabel()
        label.text = "MotoApp"
        label.textColor = UIColor(
            red: 1,
            green: 1,
            blue: 1,
            alpha: 1
        )
        label.font = UIFont(name: "Helvetica-Bold", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitleLabel = {
        let label = UILabel()
        label.text = "description"
        label.textColor = UIColor(
            red: 0.446,
            green: 0.446,
            blue: 0.446,
            alpha: 1
        )
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleVStack = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(subtitleLabel)
        return stack
    }()
    
    lazy var firstRectangleHStack = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        [getImageView(name: "Image"),
         getImageView(name: "Image1")].forEach
        { stack.addArrangedSubview($0) }
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var secondRectangleHStack = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        [getImageView(name: "Image2"),
         getImageView(name: "Image3")].forEach
        { stack.addArrangedSubview($0) }
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var vStack = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(firstRectangleHStack)
        stack.addArrangedSubview(secondRectangleHStack)
        return stack
    }()
    
    lazy var textBackgroundView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(
            red: 0.851,
            green: 0.851,
            blue: 0.851,
            alpha: 1
        )
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var textLabelTitle = {
        let textLabel = UILabel()
        textLabel.text = "gt-500"
        textLabel.font = UIFont(name: "Helvetica-Bold", size: 20)
        return textLabel
    }()
    
    lazy var textLabel = {
        let textLabel = UILabel()
        textLabel.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmods"
        textLabel.font = UIFont(name: "Helvetica", size: 16)
        textLabel.numberOfLines = 0
        return textLabel
    }()
    
    lazy var textVStack = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(textLabelTitle)
        stack.addArrangedSubview(textLabel)
        return stack
    }()
    
    lazy var photosHStack = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        [getPhotoImageView(name: "Image4"),
         getPhotoImageView(name: "Image5")].forEach
        { stack.addArrangedSubview($0) }
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var nextButton = {
        let button = UIButton()
        button.setTitle("next", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        button.backgroundColor = UIColor(red: 0, green: 169 / 255, blue: 7 / 255, alpha: 1)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        
        view.addSubview(vStack)
        view.addSubview(titleVStack)
        view.addSubview(textBackgroundView)
        view.addSubview(photosHStack)
        view.addSubview(nextButton)
        textBackgroundView.addSubview(textVStack)
        
        NSLayoutConstraint.activate([
            
            titleVStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 37),
            titleVStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 37),
            vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            textBackgroundView.topAnchor.constraint(equalTo: vStack.bottomAnchor, constant: 34),
            textBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            textVStack.topAnchor.constraint(equalTo: textBackgroundView.topAnchor, constant: 20),
            textVStack.leadingAnchor.constraint(equalTo: textBackgroundView.leadingAnchor, constant: 20),
            textVStack.trailingAnchor.constraint(equalTo: textBackgroundView.trailingAnchor, constant: -20),
            textVStack.bottomAnchor.constraint(equalTo: textBackgroundView.bottomAnchor, constant: -20),
            
            photosHStack.topAnchor.constraint(equalTo: textBackgroundView.bottomAnchor, constant: 20),
            photosHStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            photosHStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 62)
        ])
    }
    
    private func getImageView(name: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: name)
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func getPhotoImageView(name: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: name)
        imageView.contentMode = .scaleToFill
        imageView.heightAnchor.constraint(equalToConstant: view.bounds.width / 2 - 24).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.bounds.width / 2 - 24).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}
