//
//  PopoverViewController.swift
//  Marathon5thTask
//
//  Created by Артем Соколовский on 13.07.2023.
//

import UIKit

class PopoverViewController: UIViewController {
	
	lazy var segmentedControl: UISegmentedControl = {
		let segmentedControl = UISegmentedControl()
		segmentedControl.addTarget(self, action: #selector(segmetValueChanged(sender:)), for: .valueChanged)
		segmentedControl.insertSegment(withTitle: "280pt", at: 0, animated: false)
		segmentedControl.insertSegment(withTitle: "150pt", at: 1, animated: false)
		segmentedControl.selectedSegmentIndex = 0
		return segmentedControl
	}()
	
	lazy var closeButton: UIButton = {
		let button = UIButton()
		var config = UIButton.Configuration.plain()
		config.image = UIImage(systemName: "xmark.circle.fill")
		config.baseForegroundColor = .systemGray2
		button.addTarget(self, action: #selector(closePopover), for: .touchUpInside)
		button.configuration = config
		return button
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		view.addSubview(segmentedControl)
		view.addSubview(closeButton)
    }
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		
		segmentedControl.translatesAutoresizingMaskIntoConstraints = false
		
		let x = segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		let width = segmentedControl.widthAnchor.constraint(equalToConstant: view.bounds.width / 2)
		let y = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)
		let height = segmentedControl.heightAnchor.constraint(equalToConstant: 30)
		
		let constraints = [x, width, y, height]
		
		closeButton.translatesAutoresizingMaskIntoConstraints = false
		
		let xButton = closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
		let yButton = closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)
		let widhtButton = closeButton.widthAnchor.constraint(equalToConstant: 30)
		let heightButton = closeButton.heightAnchor.constraint(equalToConstant: 30)
		
		let buttonConstraints = [xButton, yButton, widhtButton, heightButton]
		
		NSLayoutConstraint.activate(constraints)
		NSLayoutConstraint.activate(buttonConstraints)
	}
	
	@objc func segmetValueChanged(sender: UISegmentedControl) {
		if sender.selectedSegmentIndex == 0 {
			
			preferredContentSize = .init(width: 300, height: 280)
			
		} else {
			
			preferredContentSize = .init(width: 300, height: 150)
		}
	}
	
	@objc func closePopover() {
		dismiss(animated: true)
	}
}
