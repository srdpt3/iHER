//
//  ScoreView.swift
//  HER
//
//  Created by Dustin yang on 3/23/21.
//

import SwiftUI

struct ScoreView: View {
    @State var companyName : String
    @ObservedObject private var chartViewModel = ChartViewModel()
    @State var score : Score?
    
    @State var ymax : Int = 100
    
    let radar_graph_ratio =  UIScreen.main.bounds.height < 896.0 ? 2.6 : 2.62
    let bar_graph_ratio =  UIScreen.main.bounds.height < 896.0 ? 4.1 : 3.96
    
    @State var totalNum : Int = 0
    @State var scoreData:[Double] = [0,0,0,0,0,0]
    @State var numVoteData:[Int] = [0,0,0,0,0,0]
    @State var buttonTitle : [String] = ["benefit", "Career","Culture", "Innovation", "Management","Work life Balance"]
    
    @State var voteBarData:[Double] = [0,0,0,0,0]
    
    var body: some View {
        
        
        //        ScrollView(.vertical, showsIndicators: true) {
        LazyVStack(alignment: .leading) {
            
          
            
            //
            //                            VStack{
            //                                Text("Negative Comment")
            //                                    .font(.title2)
            //                                    .foregroundColor(Color("Color11"))
            //                                AreaChartView().frame(height: 300)
            //
            //                            }.padding(.horizontal)
            //                AreaChartView().frame(height: 300)
            
            
            
            
            Spacer()
            if(self.score != nil){
                VStack{
    //                Text("Sentimental Score")
    //                    .font(.title2)
    //                    .foregroundColor(Color("blue"))
                    AreaChartView().frame(height: 300).padding()
                    
                }.padding(.horizontal)
                Divider()
                ChartView_Bar(data: self.$scoreData, totalNum: self.$ymax, categories: self.buttonTitle).frame(height: 300).padding()
                
                
            }else{
                LoadingScreen()
            }
            
            
            
            
            
            //                    ChartView_Sample(data: self.$voteData, numVote: self.$numVoteData, totalNum: self.$ymax, categories: self.buttonTitle)
            //                    ChartView(data: self.voteData, numVote: self.numVoteData, totalNum: self.ymax, categories: self.buttonTitle).frame(width: UIScreen.main.bounds.width   , height: UIScreen.main.bounds.height/CGFloat(bar_graph_ratio))
            //                        .offset(y : -15)
            Spacer()
            
        }.onAppear(){
            if(Reachabilty.HasConnection()){
                self.loadChartData()
                
            }
        }
        //        .frame(width: UIScreen.main.bounds.width - 35  , height: UIScreen.main.bounds.height/CGFloat(bar_graph_ratio))
        //
        //        }
        
    }
    
    
    
    
    //    init(){
    //        if(Reachabilty.HasConnection()){
    //            //            self.chartViewModel.l()
    //
    //        }
    //    }
    func loadChartData(){
        self.score = nil
        self.scoreData = [0,0,0,0,0,0]
        self.chartViewModel.loadChartData(companyName: companyName, onSuccess: { (score) in
            
            self.score = score
            
            let attr1 = (Double(score.benefit_score)  * 100).roundToDecimal(0)
            let attr2 = (Double(score.career_score)  * 100).roundToDecimal(0)
            let attr3 = (Double(score.culture_score)  * 100).roundToDecimal(0)
            let attr4 = (Double(score.innovation_score)  * 100).roundToDecimal(0)
            let attr5 = (Double(score.management_score)  * 100).roundToDecimal(0)
            let attr6 = (Double(score.work_life_score)  * 100).roundToDecimal(0)
            
            self.scoreData = [attr1, attr2, attr3, attr4, attr5,attr6]
        }
        )
    }
    
    
    
    
}



