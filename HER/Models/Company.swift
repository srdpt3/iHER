//
//  Company.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//

import Foundation

struct Company: Encodable, Decodable {
    var Bgei_Data_Excllnce_Score :Double
    var Bgei_Disclsre_Score: Double
    var Bgei_Equal_Pay_Score: Double
    var Bgei_Femle_Leadrshp_Score: Double
    var Bgei_Inclsve_Cultre_Score: Double
    var Bgei_Prowomn_Brand_Score: Double
    var Bgei_Score: Double
    
    
    
    var Bgei_Sexl_Harssmnt_Plcy_Score : Double
    var Bics_Level_1_Sector_Name: String
    var Cntry_Of_Domicile: String
//    var Company_Description: String
    
    var Company_Name : String
    var Eqy_Fiscal_Yr_End: Double
    var Long_Comp_Name: String
    var Sector: String
    var desc : String

    var Ticker: String
    var Website: String
    var ticker: String
    var logo : String
    init(Bgei_Data_Excllnce_Score: Double, Bgei_Disclsre_Score: Double, Bgei_Equal_Pay_Score: Double, Bgei_Femle_Leadrshp_Score: Double, Bgei_Inclsve_Cultre_Score: Double, Bgei_Prowomn_Brand_Score:Double, Bgei_Score : Double,
         Bgei_Sexl_Harssmnt_Plcy_Score: Double, Bics_Level_1_Sector_Name: String, Cntry_Of_Domicile: String, Company_Name: String, Eqy_Fiscal_Yr_End:Double, Long_Comp_Name : String, Sector: String, Ticker: String, Website: String, ticker: String, logo:String,desc:String
         
    ) {
        self.Bgei_Data_Excllnce_Score = Bgei_Data_Excllnce_Score
        self.Bgei_Disclsre_Score = Bgei_Disclsre_Score
        self.Bgei_Equal_Pay_Score = Bgei_Equal_Pay_Score
        self.Bgei_Femle_Leadrshp_Score = Bgei_Femle_Leadrshp_Score
        self.Bgei_Inclsve_Cultre_Score = Bgei_Inclsve_Cultre_Score
        self.Bgei_Prowomn_Brand_Score = Bgei_Prowomn_Brand_Score
        self.Bgei_Score = Bgei_Score
        
        self.Bgei_Sexl_Harssmnt_Plcy_Score = Bgei_Sexl_Harssmnt_Plcy_Score
        self.Bics_Level_1_Sector_Name = Bics_Level_1_Sector_Name
        self.Cntry_Of_Domicile = Cntry_Of_Domicile
//        self.Company_Description = Company_Description
        self.Company_Name = Company_Name
        self.Eqy_Fiscal_Yr_End = Eqy_Fiscal_Yr_End
        self.Long_Comp_Name = Long_Comp_Name
        self.Sector = Sector
        self.Ticker = Ticker
        self.ticker = ticker
        self.Website = Website
        self.logo = logo
        self.desc = desc

        
        
    }
    init(_dictionary: NSDictionary) {
                
        Bgei_Data_Excllnce_Score = _dictionary["Bgei_Data_Excllnce_Score"] as! Double
        Bgei_Disclsre_Score = _dictionary["Bgei_Disclsre_Score"] as! Double
        Bgei_Equal_Pay_Score = _dictionary["Bgei_Equal_Pay_Score"] as! Double
        Bgei_Femle_Leadrshp_Score = _dictionary["Bgei_Femle_Leadrshp_Score"] as! Double
        Bgei_Inclsve_Cultre_Score = _dictionary["Bgei_Inclsve_Cultre_Score"] as! Double
        Bgei_Prowomn_Brand_Score = _dictionary["Bgei_Prowomn_Brand_Score"] as! Double
        Bgei_Score = _dictionary["Bgei_Score"] as! Double
        
        Bgei_Sexl_Harssmnt_Plcy_Score = _dictionary["Bgei_Sexl_Harssmnt_Plcy_Score"] as! Double
        Bics_Level_1_Sector_Name = _dictionary["Bics_Level_1_Sector_Name"] as! String
        Cntry_Of_Domicile = _dictionary["Cntry_Of_Domicile"] as! String
//        Company_Description = _dictionary["Company_Description"] as! String
        Company_Name = _dictionary["Company_Name"] as! String
        Eqy_Fiscal_Yr_End = _dictionary["Eqy_Fiscal_Yr_End"] as! Double
        Long_Comp_Name = _dictionary["Long_Comp_Name"] as! String
        Sector = _dictionary["Sector"] as! String
        Ticker = _dictionary["Ticker"] as! String
        ticker = _dictionary["ticker"] as! String
        Website = _dictionary["Website"] as! String
        logo = _dictionary["logo"] as! String

        desc = _dictionary["desc"] as! String

        
    }
    
}
