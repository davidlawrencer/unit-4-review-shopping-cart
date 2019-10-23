//
//  CreateItemViewController.swift
//  unit-4-review
//
//  Created by David Rifkin on 10/23/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class CreateItemViewController: UIViewController {

    var priceValue: Double = 0.0 {
        didSet {
            priceLabel.text = String(priceValue)
        }
    }

    lazy var priceLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    lazy var nameInput: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter a name"
        return textField
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setImage(.checkmark, for: .normal)
        button.addTarget(self, action: #selector(submitButtonPressed), for: .touchDown)
        return button
    }()
    
    lazy var priceStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.maximumValue = 100
        stepper.minimumValue = 0
        stepper.stepValue = 5
        stepper.value = 0
        stepper.addTarget(self, action: #selector(stepperValueChanged(sender:)), for: .valueChanged)
        return stepper
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubviews()
        constrainSubviews()
    }
    
    private func addSubviews() {
        self.view.addSubview(nameInput)
        self.view.addSubview(priceStepper)
        self.view.addSubview(priceLabel)
        self.view.addSubview(submitButton)
    }
    
    private func constrainSubviews() {
        constrainName()
        constrainStepper()
        constrainPriceLabel()
        constrainSubmitButton()
    }
    
    private func constrainName() {
        nameInput.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameInput.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            nameInput.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            nameInput.heightAnchor.constraint(equalToConstant: 150),
            nameInput.widthAnchor.constraint(equalToConstant: self.view.frame.width / 2)
        ])
    }
    
    private func constrainStepper() {
        priceStepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceStepper.topAnchor.constraint(equalTo: nameInput.bottomAnchor, constant: 30),
            priceStepper.heightAnchor.constraint(equalToConstant: 70),
            priceStepper.widthAnchor.constraint(equalToConstant: 50),
            priceStepper.trailingAnchor.constraint(equalTo: nameInput.trailingAnchor)
        ])
    }
    
    private func constrainPriceLabel() {
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.heightAnchor.constraint(equalToConstant: 25),
            priceLabel.leadingAnchor.constraint(equalTo: nameInput.leadingAnchor),
            priceLabel.trailingAnchor.constraint(lessThanOrEqualTo: priceStepper.leadingAnchor, constant: 40),
            priceLabel.topAnchor.constraint(equalTo: priceStepper.topAnchor)
        ])
    }
    
    private func constrainSubmitButton() {
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.heightAnchor.constraint(equalToConstant: 80),
            submitButton.widthAnchor.constraint(equalToConstant: 80),
            submitButton.topAnchor.constraint(equalTo: priceStepper.bottomAnchor, constant: 60),
            submitButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    @objc private func stepperValueChanged(sender:UIStepper) {
        priceValue = sender.value
    }
    
    @objc private func submitButtonPressed() {
        //create a new cell
        //persist the data
    }
}
