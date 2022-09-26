//
//  BarChartsViewController.swift
//  ChartsDemo
//
//  Created by Sunil Sharma on 23/09/22.
//

import UIKit
import Charts

class BarChartsViewController: UIViewController {

    @IBOutlet weak var barChart: BarChartView!
    let players = ["Williamson", "Smith", "Kohli", "Sachin", "Bumrah", "Jadeja"]
    let hundreds = [6, 8, 26, 30, 8, 10]
    override func viewDidLoad() {
        super.viewDidLoad()
        barChartData(playerList: players, values: hundreds.map { Double($0) })
        barChart.animate(yAxisDuration: 1.0)
        barChart.xAxis.gridColor = .clear
        barChart.leftAxis.gridColor = .clear
        barChart.rightAxis.gridColor = .clear
        barChart.drawBordersEnabled = false
        barChart.leftAxis.enabled = false
        barChart.rightAxis.enabled = false
        barChart.scaleXEnabled = false
        barChart.doubleTapToZoomEnabled = false
        barChart.drawValueAboveBarEnabled = false
        
    }
    func barChartData(playerList : [String] , values : [Double]){
        barChart.noDataText = "Data coudn't load"
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<playerList.count {
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [Double(values[i]) ,3.0 , 5.0] , data:players[i])
        dataEntries.append(dataEntry)
        }
        let colorSet : [UIColor]! =  [UIColor.yellow , UIColor.green , UIColor.blue]
        let chartDataSet = BarChartDataSet(entries: dataEntries , label: "")
        chartDataSet.setColors(colorSet, alpha: 1.0)
        let chartData = BarChartData(dataSet: chartDataSet)
        barChart.data = chartData
        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: players)
        barChart.xAxis.labelPosition = .bottom
    
    }

}
