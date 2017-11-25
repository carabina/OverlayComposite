//
//  ViewController.swift
//  Sample App
//
//  Created by Aaron Sutton on 11/24/17.
//  Copyright © 2017 Aaron Sutton. All rights reserved.
//

import UIKit
import Overlay

class ViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func addOverlay() {
		let layers =
			[
				0: UIImage(named: "Square")!,
				1: UIImage(named: "Triangle")!,
				2: UIImage(named: "Polygon")!
			]
		guard let compositeLayers = try? OLLayers(with: layers) else {
			return
		}
		compositeLayers.removeLayer(0)

		DispatchQueue.global(qos: .userInitiated).async {
			let image = compositeLayers.layer(0) ?? UIImage(named: "Square")!
			DispatchQueue.main.async {
				self.imageView.image = image
			}
		}
	}
}
