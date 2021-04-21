//
//  TopView.swift
//  HER
//
//  Created by Dustin yang on 3/28/21.
//

import SwiftUI

struct TopView: View {
    
    
    @Environment(\.presentationMode) var presentation
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20))
                        .padding()
                        .foregroundColor(.black)
                })

                Text(Date(), style: .date)

                    .font(.system(size: 24, weight: .semibold))
                
                Text(Date(), style: .time)
            }
            
            Spacer()
        }
    }
}
