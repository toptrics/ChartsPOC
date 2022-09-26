//
//  ViewController.swift
//  ChartsDemo
//
//  Created by Sunil Sharma on 23/09/22.
//

import UIKit
import Charts

class ViewController: UIViewController {
    let players = ["Williamson", "Smith", "Kohli", "Sachin", "Bumrah", "Jadeja"]
    let hundreds = [6, 8, 26, 30, 8, 10]
    @IBOutlet weak var pieChartView: PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pieChartData(playerList: players, values: hundreds.map { Double($0)})
    }
    func pieChartData(playerList : [String] , values : [Double]){
        pieChartView.noDataText = "Data coudn't load"
        var dataEntries: [PieChartDataEntry] = []
        for i in 0..<playerList.count {
            let dataEntry = PieChartDataEntry(value: Double(i), data: values[i])
        dataEntries.append(dataEntry)
        }
        let colorSet : [UIColor]! =  [UIColor.yellow , UIColor.green , UIColor.blue,UIColor.yellow , UIColor.green , UIColor.blue]
        let chartDataSet = PieChartDataSet(entries: dataEntries , label: "")
        chartDataSet.setColors(colorSet, alpha: 1.0)
        let chartData = PieChartData(dataSet: chartDataSet)
        pieChartView.data = chartData
    
    }

}

