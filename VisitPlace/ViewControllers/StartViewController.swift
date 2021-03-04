//
//  ViewController.swift
//  VisitPlace
//
//  Created by Oleksiy Chebotarov on 26/02/2021.
//

import UIKit
import Lottie

class StartViewController: UIViewController, Storyboarded {
    private var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationView.play()
    }
    
    private func addAnimation() {
        let animation = Animation.named("passport-travel")
        animationView = AnimationView(animation: animation)
        view.addSubview(animationView)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        animationView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10.0).isActive = true
        animationView.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
    }

    // MARK: - Actions

    @objc func startTapped(_: UIButton) {
        coordinator?.coordinateToArticles()
    }

    // MARK: - Properties

    var coordinator: StartFlow?

    let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Articles", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.systemTeal.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: -1, height: 3)
        button.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}

// MARK: - UI Setup

extension StartViewController {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        view.backgroundColor = .white
        view.addSubview(startButton)

        NSLayoutConstraint.activate([
            startButton.widthAnchor
                .constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            startButton.heightAnchor
                .constraint(equalToConstant: 50),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30.0),
        ])
    }
}
