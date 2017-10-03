//
//  ViewController.swift
//  PostcardDemo
//
//  Created by Tinnell, Clay on 10/2/17.
//  Copyright © 2017 Tinnell, Clay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var colors = [UIColor]()
    
    @IBOutlet weak var postcard: UIImageView!
    @IBOutlet weak var colorSelection: UICollectionView!
    
    var image: UIImage?
    var topText = "Visit London"
    var bottomText = "Home of Sherlock Holmes, Paddington Bear, and James Bond"
    var topFontName = "Helvetica Neue"
    var bottomFontName = "Helvetica Neue"
    var topColor = UIColor.white
    var bottomColor = UIColor.white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureColors()
        renderPostcard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func configureColors() {
        colors += [.black, .gray, .white, .orange, .red, .magenta, .purple, .blue, .cyan, .green]
        for i in 0...9 {
            for j in 1...10 {
                let color = UIColor(hue: CGFloat(i) / 10, saturation: CGFloat(j) / 10, brightness: 1, alpha: 1)
                colors.append(color)
            }
        }
    }
    
    private func renderPostcard() {
        let drawRect = CGRect(x: 0, y: 0, width: 3000, height: 2400)
        
        let topTextRect = CGRect(x: 250, y: 200, width: 2500, height: 800)
        let bottomTextRect = CGRect(x: 250, y: 1800, width: 2500, height: 600)
        
        let topFont = UIFont(name: topFontName, size: 350) ?? UIFont.systemFont(ofSize: 250)
        let bottomFont = UIFont(name: bottomFontName, size: 150) ?? UIFont.systemFont(ofSize: 100)

        let centered = NSMutableParagraphStyle()
        centered.alignment = .center
        
        let topTextAttributes : [NSAttributedStringKey: Any] = [.foregroundColor: topColor, .font: topFont, .paragraphStyle: centered]
        let bottomTextAttributes : [NSAttributedStringKey: Any] = [.foregroundColor: bottomColor, .font: bottomFont, .paragraphStyle: centered]
        
        let renderer = UIGraphicsImageRenderer(size: drawRect.size)
        postcard.image = renderer.image(actions: { (ctx) in
            UIColor.gray.set()
            ctx.fill(drawRect)
            
            image?.draw(at: CGPoint(x: 0, y: 0))
            
            topText.draw(in: topTextRect, withAttributes: topTextAttributes)
            bottomText.draw(in: bottomTextRect, withAttributes: bottomTextAttributes)
        })

    }
    
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        return cell
    }
}
