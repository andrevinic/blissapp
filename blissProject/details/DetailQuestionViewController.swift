//
//  DetailQuestionViewController.swift
//  blissProject
//
//  Created by André Nogueira on 12/19/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit
import Charts

class DetailQuestionViewController:BaseViewController {

    @IBOutlet weak var PieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pie Chart"
        
        self.options = [.toggleValues,
                        .toggleXValues,
                        .togglePercent,
                        .toggleHole,
                        .toggleIcons,
                        .animateX,
                        .animateY,
                        .animateXY,
                        .spin,
                        .drawCenter,
                        .saveToGallery,
                        .toggleData]
        
        self.setup(pieChartView: PieChartView)
        
        
        PieChartView.delegate = self
        let l = PieChartView.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .top
        l.orientation = .vertical
        l.xEntrySpace = 7
        l.yEntrySpace = 0
        l.yOffset = 0
        //        chartView.legend = l
        // entry label styling
        PieChartView.entryLabelColor = .white
        PieChartView.entryLabelFont = .systemFont(ofSize: 12, weight: .light)
//        
//        sliderX.value = 4
//        sliderY.value = 100
//        self.slidersValueChanged(nil)
        
        PieChartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
