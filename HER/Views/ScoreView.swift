//
//  ScoreView.swift
//  HER
//
//  Created by Dustin yang on 3/23/21.
//

import SwiftUI

struct ScoreView: View {
    @Binding var companyName : String
    @ObservedObject private var chartViewModel = ChartViewModel()
    @State var score : Score?
    
    @State var ymax : Int = 100
    
    let radar_graph_ratio =  UIScreen.main.bounds.height < 896.0 ? 2.6 : 2.62
    let bar_graph_ratio =  UIScreen.main.bounds.height < 896.0 ? 4.0 : 3.95
    
    @State var totalNum : Int = 0
    @State var voteData:[Double] = [60.60,90.10,55.56,56.43,34.27,44.07]
    @State var numVoteData:[Int] = [0,0,0,0,0,0]
    @State var buttonTitle : [String] = ["benefit", "Career","Culture", "Innovation", "Management","Work life Balance"]
    
    @State var voteBarData:[Double] = [0,0,0,0,0]
    
    var body: some View {

        
                VStack{
                    

                    ChartView(data: self.$voteData, numVote: self.$numVoteData, totalNum: self.$ymax, categories: self.buttonTitle)
                        .frame(width: UIScreen.main.bounds.width   , height: UIScreen.main.bounds.height/CGFloat(bar_graph_ratio))
                        //                        .offset(y : -15)
                    
//                    ChartView_Sample(data: self.$voteData, numVote: self.$numVoteData, totalNum: self.$ymax, categories: self.buttonTitle)
//                    ChartView(data: self.voteData, numVote: self.numVoteData, totalNum: self.ymax, categories: self.buttonTitle).frame(width: UIScreen.main.bounds.width   , height: UIScreen.main.bounds.height/CGFloat(bar_graph_ratio))
//                        .offset(y : -15)
        
                }.onAppear(){
                    if(Reachabilty.HasConnection()){
//                        self.loadChartData()
        
                    }
                }
        
    }
    
    
    
    
    //    init(){
    //        if(Reachabilty.HasConnection()){
    //            //            self.chartViewModel.l()
    //
    //        }
    //    }
    func loadChartData(){
        self.chartViewModel.loadChartData(companyName: "Uber", onSuccess: { (score) in
            
            self.score = score
            print(score)
            
        }
        )
    }
    
    
    
    
}



