//
//  AreaChartView.swift
//  HER
//
//  Created by Dustin yang on 3/29/21.
//


import SwiftUI
import AAInfographics

struct AreaChartView: UIViewRepresentable {

//    @Binding var data : [Double]
//    //    @Binding var numVote : [Int]
//
//    @Binding var totalNum : Int
//    var aaChartView: AAChartView?
//
//    var categories : [String]
    let hexColor = "#757AF9"
    let number = Float.random(in: 1..<100)
    let number2 = Float.random(in: 1..<100)
    let number3 = Float.random(in: 1..<100)

    let number4 = Float.random(in: 1..<100)

    //        "#A3ADF9"
    let areaType = AAChartType.area
//    var aaChartView = AAChartView()
    let animationType : AAChartAnimationType = AAChartAnimationType.bounce
    let gradientColorDic = [
        "linearGradient": [
            "x1": 0,
            "y1": 0,
            "x2": 0,
            "y2": 1
        ],
        "stops": [[0,"#f093fb"],
                  [1,"#f5576c"]]//颜色字符串设置支持十六进制类型和 rgba 类型
    ] as [String : AnyObject]
    
    let gradientColorDic1 = AAGradientColor.linearGradient(
        direction: .toTop,
        startColor: "#f093fb",
        endColor: "#f5576c"//颜色字符串设置支持十六进制类型和 rgba 类型
    )
    let gradientColorArr = [
        AAGradientColor.oceanBlue,
        AAGradientColor.sanguine,
        AAGradientColor.lusciousLime,
        AAGradientColor.purpleLake,
        AAGradientColor.freshPapaya,
        AAGradientColor.ultramarine,
        AAGradientColor.pinkSugar,
        AAGradientColor.lemonDrizzle,
        AAGradientColor.victoriaPurple,
        AAGradientColor.springGreens,
        AAGradientColor.mysticMauve,
        AAGradientColor.reflexSilver,
        AAGradientColor.newLeaf,
        AAGradientColor.cottonCandy,
        AAGradientColor.pixieDust,
        AAGradientColor.fizzyPeach,
        AAGradientColor.sweetDream,
        AAGradientColor.firebrick,
        AAGradientColor.wroughtIron,
        AAGradientColor.deepSea,
        AAGradientColor.coastalBreeze,
        AAGradientColor.eveningDelight,
    ]
    
    
    
    func updateUIView(_ uiView: AAChartView, context:  UIViewRepresentableContext<Self>) {
        

        uiView.aa_onlyRefreshTheChartDataWithChartModelSeries([
            AASeriesElement().name(SERIES_TITLE).colorByPoint(true)
                .dataSorting(AADataSorting()
                                .enabled(true).matchByName(true))
//                .data(randomDataArray())
            //            AASeriesElement()
            //            .name("받은 투표순")
            //            .type(.line)
            ////            .yAxis(0)
            ////                .dataSorting(AADataSorting()
            ////            .enabled(true).matchByName(true))
            //            .data([numVote[0],numVote[1],numVote[2],numVote[3],numVote[4]]).color(AAGradientColor.mysticMauve)
            //            .data([numVote[0], numVote[1], numVote[2], numVote[3], numVote[4]])
        ])
        
        
    }
    
     func makeUIView(context: Context) -> AAChartView {
        //        let element3 = AASeriesElement()
        //             .name("받은 투표수")
        //             .type(.line)
        ////             .yAxis(0)
        ////            .dataSorting(AADataSorting()
        ////             .enabled(true).matchByName(true))
        //             .data([numVote[0],numVote[1],numVote[2],numVote[3],numVote[4]]).color(AAGradientColor.mysticMauve)
        
        let aaChartView : AAChartView = AAChartView()
        aaChartView.scrollEnabled = true
//        aaChartView.delegate = self as AAChartViewDelegate
        aaChartView.aa_adaptiveScreenRotation()
//        view.addSubview(aaChartView!)
        
        aaChartView.translatesAutoresizingMaskIntoConstraints = false
        aaChartView.scrollView.contentInsetAdjustmentBehavior = .never

        
//        let aaChartModel = AAChartModel()
//            .chartType(.area)
//            .stacking(.normal)
//            .dataLabelsEnabled(false)
//            .colorsTheme([gradientColorDic1,gradientColorDic2, AAGradientColor.cottonCandy])
//            .scrollablePlotArea(AAScrollablePlotArea()
//                .minWidth(3000)
//                .scrollPositionX(1))
//            .series(configureSeriesDataArray())
        //        aaChartView.aa_drawChartWithChartModel(aaChartModel)

        let aaChartModel = AAChartModel()
            .chartType(.area)
            .categories(["Aug", "Sep", "Oct","Nov", "Dec","Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul"])
            .legendEnabled(true)
            .dataLabelsEnabled(false)
                        .scrollablePlotArea(AAScrollablePlotArea()
                            .minWidth(1000)
                            .scrollPositionX(1))
            .stacking(.normal)

            .colorsTheme([ AAGradientColor.coastalBreeze,AAGradientColor.lemonDrizzle])
//            .colorsTheme([ AAGradientColor.pinkSugar,AAGradientColor.lemonDrizzle,AAGradientColor.victoriaPurple,
//                           AAGradientColor.springGreens,AAGradientColor.coastalBreeze,])
            .animationType(.easeOutCubic)
            .animationDuration(1200)
            
            .touchEventEnabled(true)
            .series([
                AASeriesElement()
                    .name("Sentimenal Score")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 67.0, 9.6])
                    ,
                AASeriesElement()
                    .name("Data score")
                    .data([0.2, 24, 5.7, 76.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
                    ,
//                AASeriesElement()
//                    .name("work life balance")
//                    .data([0.9, 0.6, 3.5, 23.4, 13.5, 17.0, 18.6, 17.9, 14.3, 10.0, 3.9, 1.0])
//                    ,
//                AASeriesElement()
//                    .name("management")
//                    .data([31.9, 4.2, 5.7, 8.5, 11.9, 90.2, 17.0, 16.6, 14.2, 45.3, 6.6, 4.8])
//                    ,
//                AASeriesElement()
//                    .name("career")
//                    .data([1.9, 10.2, 46.7, 2.5, 22.9, 10.2, 67.0, 16.6, 23.2, 12.3, 90.6, 5.8])
//                    ,
                ])
        
        aaChartModel.touchEventEnabled = true
//        aaChartModel.yAxisMax(100.0)
        
        aaChartView.aa_drawChartWithChartModel(aaChartModel)
        return aaChartView
    }
    
//    private func randomDataArray() -> [Any] {
//
//
//        let dataArr = NSMutableArray()
//        for  (index, element) in categories.enumerated() {
//            let dataElementDic = NSMutableDictionary()
//            dataElementDic["name"] = element
//            dataElementDic["y"] = (data[index])
//            dataArr.add(dataElementDic)
//        }
//
//        return dataArr as! [Any]
//    }
    
    
  
    
    private func configureSeriesDataArray() -> [AASeriesElement] {
        var randomNumArrA = [Any]()
        var randomNumArrB = [Any]()
        var randomNumArrC = [Any]()
        var randomNumArrD = [Any]()

        var y1 = 0.0
        var y2 = 0.0
        var y3 = 0.0
        var y4 = 0.0
        let Q = Int(arc4random() % 38)
        
        for  x in 0 ..< 100 {
            y1 = Double(number)
            y2 = Double(number2)
            y3 = Double(number3)
            y4 = Double(number4)
            randomNumArrA.append(y1)
            randomNumArrB.append(y2)
            randomNumArrC.append(y3)
            randomNumArrD.append(y4)

        }
        
        let chartSeriesArr = [
            AASeriesElement()
                .name("2021")
                .lineWidth(5)
                .step(false)
                .data(randomNumArrA),
            AASeriesElement()
                .name("2020")
                .lineWidth(5)
                .step(false)
                .data(randomNumArrB),
            AASeriesElement()
                .name("2019")
                .lineWidth(5)
                .step(false)
                .data(randomNumArrC),
            AASeriesElement()
                .name("2018")
                .lineWidth(5)
                .step(false)
                .data(randomNumArrD)
        ]
        return chartSeriesArr
    }
}
