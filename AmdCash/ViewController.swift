//
//  ViewController.swift
//  AmdCash
//
//  Created by Gev on 24.10.21.
//

import UIKit
import Charts

class ViewController: UIViewController,ChartViewDelegate {

    @IBOutlet weak var SettingButton: UIImageView!
    
    @IBOutlet weak var PlusButton: UIButton!
    
    @IBOutlet weak var MinusButton: UIButton!
    
    @IBOutlet weak var plusLabel: UILabel!
    
    @IBOutlet weak var minusLabel: UILabel!
    
    @IBOutlet weak var pieChart: PieChartView!
    
    //    var pieChart = PieChartView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pieChart.frame = CGRect(x: 0, y: 0,
                                width: self.view.frame.width,
                                height:self.view.frame.width)
        pieChart.center = view.center
        pieChart.entryLabelColor = UIColor.black
        pieChart.drawEntryLabelsEnabled = false
        pieChart.usePercentValuesEnabled = true
        pieChart.usePercentValuesEnabled = true
        pieChart.drawSlicesUnderHoleEnabled = true
        pieChart.holeRadiusPercent = 0.58
        pieChart.chartDescription?.enabled = true
        pieChart.drawCenterTextEnabled = true
        pieChart.centerAttributedText = NSAttributedString(string: "String")
        pieChart.drawHoleEnabled = true
        pieChart.rotationAngle = 0
        pieChart.rotationEnabled = true
        pieChart.highlightPerTapEnabled = true
        view.addSubview(pieChart)
//        pieChart.chartDescription?.enabled = false
        var entries = [ChartDataEntry]()
        entries.append(PieChartDataEntry(value: 20.0, label: "Taxi", icon: NSUIImage(named: "Taxi")))
        entries.append(PieChartDataEntry(value: 10.0, label: "communications",icon: NSUIImage(named: "communications")) )
        entries.append(PieChartDataEntry(value: 30.0, label: "car", icon: NSUIImage(named: "car")) )
        entries.append(PieChartDataEntry(value: 40.0, label: "Clothes", icon: NSUIImage(named: "clothes")) )
        entries.append(PieChartDataEntry(value: 30.0, label: "eating out", icon: NSUIImage(named: "eathing out" )) )
        entries.append(PieChartDataEntry(value: 20.0, label: "enterainment", icon: NSUIImage(named: "enterainment")) )
        entries.append(PieChartDataEntry(value: 40.0, label: "Food", icon: NSUIImage(named: "Food") ))
        entries.append(PieChartDataEntry(value: 0.0, label: "gifts", icon: NSUIImage(named: "gifts")) )
        entries.append(PieChartDataEntry(value: 0.0, label: "health", icon: NSUIImage(named: "health")) )
        entries.append(PieChartDataEntry(value: 0.0, label: "house", icon: NSUIImage(named: "house")) )
        entries.append(PieChartDataEntry(value: 0.0, label: "pets", icon: NSUIImage(named: "pets")) )
        entries.append(PieChartDataEntry(value: 12.0, label: "Sport", icon: NSUIImage(named: "Sport")) )
        entries.append(PieChartDataEntry(value: 19.0, label: "transport", icon: NSUIImage(named: "transport")) )
        entries.append(PieChartDataEntry(value: 28.0, label: "nail", icon: NSUIImage(named: "nail")) )
        
        let set = PieChartDataSet(entries: entries)
        let c1 = NSUIColor(red: 243/255.0, green: 167/255.0, blue: 255/255.0, alpha: 1.0)
        let c2 = NSUIColor(red: 107/255.0, green: 167/255.0, blue: 255/255.0, alpha: 1.0)
        let c3 = NSUIColor(red: 204/255.0, green: 209/255.0, blue: 213/255.0, alpha: 1.0)
        let c4 = NSUIColor(red: 222/255.0, green: 0/255.0, blue: 187/255.0, alpha: 1.0)
        let c5 = NSUIColor(red: 255/255.0, green: 234/255.0, blue: 158/255.0, alpha: 1.0)
        let c6 = NSUIColor(red: 255/255.0, green: 184/255.0, blue: 0/255.0, alpha: 1.0)
        let c7 = NSUIColor(red: 156/255.0, green: 219/255.0, blue: 255/255.0, alpha: 1.0)
        let c8 = NSUIColor(red: 255/255.0, green: 122/255.0, blue: 0/255.0, alpha: 1.0)
        let c9 = NSUIColor(red: 106/255.0, green: 255/255.0, blue: 103/255.0, alpha: 1.0)
        let c10 = NSUIColor(red: 0/255.0, green: 255/255.0, blue: 240/255.0, alpha: 1.0)
        let c11 = NSUIColor(red: 214/255.0, green: 73/255.0, blue: 77/255.0, alpha: 1.0)
        let c12 = NSUIColor(red: 164/255.0, green: 121/255.0, blue: 255/255.0, alpha: 1.0)
        let c13 = NSUIColor(red: 78/255.0, green: 145/255.0, blue: 149/255.0, alpha: 1.0)
        let c14 = NSUIColor(red: 255/255.0, green: 238/255.0, blue: 81/255.0, alpha: 1.0)
        let c15 = NSUIColor(red: 0/255.0, green: 56/255.0, blue: 255/255.0, alpha: 1.0)
        
        
        
        set.colors = [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15]
        set.highlightColor = NSUIColor.red
       
        let data = PieChartData(dataSet: set)
        
        pieChart.data = data
        set.drawValuesEnabled = true
        minusLabel.tag = 0
        plusLabel.tag = 1
    
    }

    @IBAction func minusButtonAction(_ sender: UIButton) {
        alertWithTF(self.minusLabel)
    }
    @IBAction func pluseButtonAction(_ sender: UIButton) {
        alertWithTF(self.plusLabel)
    }
    
    func alertWithTF(_ label:UILabel) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Income", message: "", preferredStyle: .alert)
    
        alert.addTextField { alertTextField in
            alertTextField.placeholder = ""
            alertTextField.keyboardAppearance = .dark
            alertTextField.keyboardType = .numberPad
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "Add", style: .default) { action in
//            var  currentCount = Int(label.text ?? "")
//            let count = Int(textField.text ?? "")
//            if label.tag == 0 {
//
//                currentCount -= count
//            }
            print(textField.text!)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
        
    }
}

