//
//  ChartTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 13.07.2023.
//

import DGCharts
import UIKit

class ChartTableViewCell: UITableViewCell, UIPresentable, ChartViewDelegate {

    @IBOutlet weak var lineChartView: LineChartView?
    
    var chartData: [ChartDataEntry] = []
    var tempData: [ChartDataEntry] = []
    
    var chartType: ChartType = .depth {
        didSet {
            switch chartType {
            case .depth:
                setupDepthValues()
            case .temp:
                setupTempValues()
            case .noDeco:
                setupNoDecoValues()
            case .ascent:
                setupAscentValues()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.chartData = self.generateItems()
        self.tempData = self.generateItems(range: 40)
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
                
        lineChartView?.backgroundColor = .blueDark()
        lineChartView?.xAxis.drawGridLinesEnabled = false
        lineChartView?.leftAxis.drawGridLinesEnabled = false
        lineChartView?.rightAxis.drawGridLinesEnabled = false
        lineChartView?.rightAxis.enabled = false
        
        let xAxis = lineChartView?.xAxis
        xAxis?.valueFormatter = DateValueFormatter()
        xAxis?.granularity = 3600
        xAxis?.centerAxisLabelsEnabled = true
        xAxis?.labelTextColor = .primaryGrey() ?? .gray
        xAxis?.labelFont = .regularPoppins(size: 10)
        xAxis?.labelPosition = .top
        
        let leftAxis = lineChartView?.leftAxis
        leftAxis?.valueFormatter = NumberValueFormatter()
        leftAxis?.labelTextColor = .primaryGrey() ?? .gray
        leftAxis?.labelFont = .regularPoppins(size: 10)
        leftAxis?.axisLineColor = .clear
        leftAxis?.gridColor = .primaryGrey() ?? .gray
        leftAxis?.axisMaximum = 40
        leftAxis?.axisMinimum = 0
        leftAxis?.drawGridLinesEnabled = true
        leftAxis?.granularityEnabled = true
        leftAxis?.inverted = true
        leftAxis?.gridLineDashPhase = 0
        leftAxis?.gridLineDashLengths = [2, 2]
        
        let rightAxis = lineChartView?.rightAxis
        rightAxis?.axisLineColor = .clear

        lineChartView?.delegate = self
        lineChartView?.legend.enabled = false
    }
    
    private func generateItems(count: Int = 5, range: Int = 30) -> [ChartDataEntry] {
        let now = Date().timeIntervalSince1970
        let hourSeconds: TimeInterval = 3600
        
        let from = now - (Double(count) / 2) * hourSeconds
        let to = now + (Double(count) / 2) * hourSeconds
        
        let yVals1 = stride(from: from, to: to, by: hourSeconds/6).map { (x) -> ChartDataEntry in
            let y = arc4random_uniform(UInt32(range))
            return ChartDataEntry(x: x, y: Double(y))
        }
        return yVals1
    }
    
    func setupDepthValues() {
        let data: LineChartData = [prepareLineChartData(entries: chartData, color: .primaryBlue())]
        lineChartView?.data = data
    }
    
    func setupTempValues() {
        let data: LineChartData = [
            prepareLineChartData(entries: chartData, color: .clear),
            prepareLineChartData(entries: tempData, color: .chartOrange(), fillIsClear: true)
        ]
        lineChartView?.data = data
    }
    
    func setupAscentValues() {
        let set = prepareLineChartData(entries: chartData, color: .clear)
        set.setColors(.chartBlue() ?? .blue,
                      .chartGreen() ?? .green,
                      .chartYellow() ?? .yellow,
                      .chartOrange() ?? .orange,
                      .chartRed() ?? .red)
        set.gradientPositions = [0, 20, 40, 60, 80]
        set.isDrawLineWithGradientEnabled = true
        
        let data: LineChartData = [set]
        lineChartView?.data = data
    }
    
    func setupNoDecoValues() {
        let data: LineChartData = [
            prepareLineChartData(entries: chartData, color: .clear),
            prepareLineChartData(entries: tempData, color: .chartYellow(), fillIsClear: true)
        ]
        lineChartView?.data = data
    }
    
    private func prepareLineChartData(entries: [ChartDataEntry], color: UIColor?, lineWidth: CGFloat = 1, fillIsClear: Bool = false) -> LineChartDataSet {
        let set1 = LineChartDataSet(entries: entries, label: "")
        set1.axisDependency = .left
        set1.lineWidth = lineWidth
        
        set1.fillAlpha = fillIsClear ? 0 : 0.3
        set1.fillColor = fillIsClear ? .clear : .primaryBlue() ?? .blue
        set1.highlightColor = .primaryWhite() ?? .white
        set1.drawCircleHoleEnabled = false
        set1.drawValuesEnabled = false
        set1.drawCirclesEnabled = false
        set1.drawFilledEnabled = true
        set1.mode = .horizontalBezier
        set1.setColors(color ?? .blue, .red)
        return set1
    }
}
