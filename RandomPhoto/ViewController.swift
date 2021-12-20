//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Ikechukwu Akujobi on 12/20/21.
//

import UIKit

class ViewController: UIViewController {
    
    // Image view that brings up a random image everytime the button is tapped
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        // This prevents the picture from filling up too much space
        imageView.contentMode = .scaleAspectFill
        // Give imageView a background color
        imageView.backgroundColor = .white
        return imageView
    }()
    
    // Create button - UI is User Interface
    private let button: UIButton = {
        let button = UIButton()
        // Give Button a title and background color
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    // Create an array of color so that when the user clicks on the button, the background image and color changes too
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemMint,
        .systemYellow,
        .systemPurple,
        .systemOrange
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Change background color
        view.backgroundColor = .systemPink
        // add image to view
        view.addSubview(imageView)
        // Give imageSize a length and width
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        // Center imageView
        imageView.center = view.center
        
        // Add a subView button
        view.addSubview(button)
        
        // Call the function getRandomPhoto
        getRandomPhoto()
        
        // Attach to a button
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    // Add functionality to button by adding an action and a target
    @objc func didTapButton() {
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Give button a frame
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60,
                              height: 55)
    }
    
    // Function to get random photos
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        // Convert string to image
        let url = URL(string: urlString)!
        // Get the contents of the url via data
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        // Create image from data
        imageView.image = UIImage(data: data)
    }

}

