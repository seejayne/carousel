//
//  IntroScrollViewController.swift
//  carousel
//
//  Created by Jayne Vidheecharoen on 9/18/14.
//  Copyright (c) 2014 Jayne Vidheecharoen. All rights reserved.
//

import UIKit

class IntroScrollViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var introTile1: UIImageView!
    @IBOutlet weak var introTile2: UIImageView!
    @IBOutlet weak var introTile3: UIImageView!
    @IBOutlet weak var introTile4: UIImageView!
    @IBOutlet weak var introTile5: UIImageView!
    @IBOutlet weak var introTile6: UIImageView!
    
    
    // r2Min values to plug into the method! Not actually used for anything yet. But it would be later if I could optimize it.
    // var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    // var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    // var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    // var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    
    // Sets the position of the tiles.
    func tilePosition(tileName: UIImageView, offsetAmount: Float, xMin: Float, yMin: Float, scaleMin: Float, rotateMin: Float){
        
        // variables
        var tx = convertValue(offsetAmount, r1Min: 0, r1Max: 568, r2Min: xMin, r2Max: 0)
        var ty = convertValue(offsetAmount, r1Min: 0, r1Max: 568, r2Min: yMin, r2Max: 0)
        var scale = convertValue(offsetAmount, r1Min: 0, r1Max: 568, r2Min: scaleMin, r2Max: 1)
        var rotation = convertValue(offsetAmount, r1Min: 0, r1Max: 568, r2Min: rotateMin, r2Max: 0)
        
        // animate those tiles
        tileName.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tileName.transform = CGAffineTransformScale(tileName.transform, CGFloat(scale), CGFloat(scale))
        tileName.transform = CGAffineTransformRotate(tileName.transform, CGFloat(Double(rotation) * M_PI / 180))
        
    }
    

    // set up
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.frame.size
        scrollView.delegate = self
        //scrollView.sendSubviewToBack(imageView)
        
        // Make the tiles show up at the begining
        tilePosition(introTile6, offsetAmount: 0, xMin: -70, yMin: -475, scaleMin: 1.65, rotateMin: -10)
        tilePosition(introTile5, offsetAmount: 0, xMin: -100, yMin: -508, scaleMin: 1.65, rotateMin: 10)
        tilePosition(introTile4, offsetAmount: 0, xMin: 110, yMin: -408, scaleMin: 1.6, rotateMin: 10)
        tilePosition(introTile3, offsetAmount: 0, xMin: 20, yMin: -415, scaleMin: 1.7, rotateMin: 10)
        tilePosition(introTile2, offsetAmount: 0, xMin: 75, yMin: -240, scaleMin: 1.65, rotateMin: -10)
        tilePosition(introTile1, offsetAmount: 0, xMin: -60, yMin: -285, scaleMin: 1, rotateMin: -10)
        
    }
    
    // Magic function that converts the min and max
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    // Animates things according to the scroll
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = Float(scrollView.contentOffset.y)
        
        tilePosition(introTile6, offsetAmount: offset, xMin: -70, yMin: -475, scaleMin: 1.65, rotateMin: -10)
        tilePosition(introTile5, offsetAmount: offset, xMin: -100, yMin: -508, scaleMin: 1.65, rotateMin: 10)
        tilePosition(introTile4, offsetAmount: offset, xMin: 110, yMin: -408, scaleMin: 1.6, rotateMin: 10)
        tilePosition(introTile3, offsetAmount: offset, xMin: 20, yMin: -415, scaleMin: 1.7, rotateMin: 10)
        tilePosition(introTile2, offsetAmount: offset, xMin: 75, yMin: -240, scaleMin: 1.65, rotateMin: -10)
        tilePosition(introTile1, offsetAmount: offset, xMin: -60, yMin: -285, scaleMin: 1, rotateMin: -10)
        
    }
    
    // Original code from video.
    // var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -30, r2Max: 0)
    // var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
    // var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
    // var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
    
    // introTile1.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
    // introTile1.transform = CGAffineTransformScale(introTile1.transform, CGFloat(scale), CGFloat(scale))
    // introTile1.transform = CGAffineTransformRotate(introTile1.transform, CGFloat(Double(rotation) * M_PI / 180))
    
    
    // println("content offset \(scrollView.contentOffset.y)")
    

}
