//
//  ViewController.swift
//  Marathon5thTask
//
//  Created by Артем Соколовский on 13.07.2023.
//

import UIKit

class ViewController: UIViewController {
	
	lazy var presentButton: UIButton = {
		var config = UIButton.Configuration.plain()
		config.title = "Present"
		
		let button = UIButton()
		button.configuration = config
		button.addTarget(self, action: #selector(openController), for: .touchDown)
		return button
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		view.addSubview(presentButton)
		
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		
		presentButton.translatesAutoresizingMaskIntoConstraints = false
		
		let centerX = presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		let y = presentButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
		let width = presentButton.widthAnchor.constraint(equalToConstant: 100)
		let height = presentButton.heightAnchor.constraint(equalToConstant: 50)
		
		let constraints = [centerX, y, width, height]
		
		NSLayoutConstraint.activate(constraints)
	}
	
	@objc func openController() {
		
		let popoverVC = PopoverViewController()
		popoverVC.modalPresentationStyle = .popover
		popoverVC.preferredContentSize = .init(width: 300, height: 280)
		
		guard let presentationVC = popoverVC.popoverPresentationController else { return }
		presentationVC.delegate = self
		presentationVC.sourceView = presentButton
		presentationVC.permittedArrowDirections = .up
		presentationVC.sourceRect = CGRect(x: presentButton.bounds.midX,
										   y: presentButton.bounds.maxY,
										   width: 0,
										   height: 0)
		present(popoverVC, animated: true)

	}

}

extension ViewController: UIPopoverPresentationControllerDelegate {
	func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
		.none
	}
}

