//
//  ViewController.swift
//  RadarChart
//
//  Created by Brite Solutions on 7/16/20.
//  Copyright © 2020 Brite Solutions. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController, ChartViewDelegate, IAxisValueFormatter {
    
    @IBOutlet weak var chartView: RadarChartView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var maskView: RadarChartView!
    
    let activities = ["Burger", "Steak", "Salad", "Pasta", "Pizza", "Rice"]
    var shouldHideData: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeChartView()
        makeMaskView()
    }
    
    func makeMaskView() {
        maskView.delegate = self
        maskView.chartDescription?.enabled = false
        maskView.webLineWidth = 1
        maskView.innerWebLineWidth = 0.1
        maskView.webColor = .lightGray
        maskView.innerWebColor = .lightGray
        maskView.webAlpha = 1
        imageView.mask = maskView
                
        //turn spin on/off
        maskView.rotationEnabled = false
                
        //turn detail on/off
        maskView.legend.enabled = false

        let xAxis = maskView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 12, weight: .light)
        xAxis.xOffset = 0
        xAxis.yOffset = 0
        xAxis.valueFormatter = self
        xAxis.labelTextColor = .systemPink
                
        let yAxis = maskView.yAxis
        yAxis.labelFont = .systemFont(ofSize: 9, weight: .light)
        yAxis.labelCount = 6
        yAxis.axisMinimum = 0
        yAxis.axisMaximum = 90
        yAxis.drawLabelsEnabled = false
                
        let entries: [RadarChartDataEntry] = [RadarChartDataEntry(value: 100), RadarChartDataEntry(value: 100), RadarChartDataEntry(value: 100), RadarChartDataEntry(value: 100), RadarChartDataEntry(value: 100), RadarChartDataEntry(value: 100)]
                
        let set = RadarChartDataSet(entries: entries, label: "mask")
        set.setColor(UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1))
        set.fillColor = UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1)
        set.drawFilledEnabled = true
        set.fillAlpha = 1
        set.lineWidth = 2
        set.drawHighlightCircleEnabled = false
        set.setDrawHighlightIndicators(false)
        
        let data = RadarChartData(dataSets: [set])
        data.setValueFont(.systemFont(ofSize: 8, weight: .light))
        data.setDrawValues(false)
        data.setValueTextColor(.white)
        
        maskView.data = data
    }
    
    func makeChartView() {
        chartView.delegate = self
//        chartView.chartDescription?.enabled = false
        chartView.webLineWidth = 1
        chartView.innerWebLineWidth = 0.1
        chartView.webColor = .lightGray
        chartView.innerWebColor = .lightGray
        chartView.webAlpha = 1
//        imageView.mask = chartView
//        chartView.backgroundColor = UIColor.clearch
                
                
        //turn spin on/off
        chartView.rotationEnabled = false
                
        //turn detail on/off
        chartView.legend.enabled = false
                
//        let marker = RadarMarkerView.viewFromXib()!
//        marker.chartView = chartView
//        chartView.marker = marker
                
        let xAxis = chartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 12, weight: .light)
        xAxis.xOffset = 0
        xAxis.yOffset = 0
        xAxis.valueFormatter = self
        xAxis.labelTextColor = .systemPink
                
        let yAxis = chartView.yAxis
        yAxis.labelFont = .systemFont(ofSize: 9, weight: .light)
        yAxis.labelCount = 6
        yAxis.axisMinimum = 0
        yAxis.axisMaximum = 90
        yAxis.drawLabelsEnabled = false
                
//        self.updateChartData()
        self.setChartData()
        
//        chartView.animate(xAxisDuration: 1.4, yAxisDuration: 1.4, easingOption: .easeOutBack)
    }
    
    
    func updateChartData() {
        if self.shouldHideData {
            chartView.data = nil
            return
        }
        
        self.setChartData()
    }
    
    func setChartData() {
//        let mult: UInt32 = 60
//        let min: UInt32 = 20
//        let cnt = 7
//
//    // Create random entries value for demo
//        let block: (Int) -> RadarChartDataEntry = { _ in return RadarChartDataEntry(value: Double(arc4random_uniform(mult) + min))}
//        let entries2 = (0..<cnt).map(block)
//        print(entries2)
        
        let entries2: [RadarChartDataEntry] = [RadarChartDataEntry(value: 10), RadarChartDataEntry(value: 30), RadarChartDataEntry(value: 40), RadarChartDataEntry(value: 50), RadarChartDataEntry(value: 60), RadarChartDataEntry(value: 90)]
        
        let set2 = RadarChartDataSet(entries: entries2, label: "This Week")
        set2.setColor(UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1))
        set2.fillColor = UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1)
        set2.drawFilledEnabled = true
        set2.fillAlpha = 0.7
        set2.lineWidth = 2
        set2.drawHighlightCircleEnabled = false
        set2.setDrawHighlightIndicators(false)
        
        let data = RadarChartData(dataSets: [set2])
        data.setValueFont(.systemFont(ofSize: 8, weight: .light))
        data.setDrawValues(false)
        data.setValueTextColor(.white)
        
        chartView.data = data
    }
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return activities[Int(value) % activities.count]
    }
}

