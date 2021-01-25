//
//  CurconMediumView.swift
//  curconWidgetExtension
//
//  Created by Bahadır Enes Atay on 16.01.2021.
//

import SwiftUI
import WidgetKit

struct CurconMediumView: View {
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = " E, dd MMM yyyy"
        let dateString = formatter.string(from: Date())
        return dateString
    }
    
    private var currencyViewModel: CurrencyViewModel!
    init(_currencyViewModel: CurrencyViewModel) {
        self.currencyViewModel = _currencyViewModel
    }
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()

            HStack {
                Text(" " + getDate())
                    .font(.system(size: 13, weight: .semibold, design: Font.Design.rounded))
                    .foregroundColor(Color(UIColor.systemGray6))
            }
      
            Divider()
            
            HStack {
                RoundedRectangle(cornerRadius: 1)
                    .fill(Color.green)
                    .frame(width: 2, height: 20)
                Text("£ " + (String(format: "%.0f", currencyViewModel.gbpAsBase)))
                    .font(.system(size: 16, weight: .semibold, design: Font.Design.rounded))
                    .foregroundColor(Color.white)
                Spacer()
                Text("₺ " + (String(format: "%.2f", currencyViewModel.gbpToTry)))
                    .font(.system(size: 16, weight: .semibold, design: Font.Design.rounded))
                    .foregroundColor(Color.white)
                Spacer()
                if currencyViewModel.tr > currencyViewModel.tr {
                    Image(systemName: "arrow.down")
                        .foregroundColor(Color.red)
                } else if currencyViewModel.tr < currencyViewModel.tr {
                    Image(systemName: "arrow.up")
                        .foregroundColor(Color.green)
                } else {
                    Image(systemName: "minus")
                        .foregroundColor(Color(UIColor.systemGray6))
                }
                Spacer()
                Text("₺ " + (String(format: "%.2f", currencyViewModel.gbpToTry)))
                    .font(.system(size: 14, weight: .semibold, design: Font.Design.rounded))
                    .foregroundColor(Color(UIColor.systemGray4))
                Spacer()

            }
            
            Divider()
            HStack {
                RoundedRectangle(cornerRadius: 1)
                    .fill(Color.purple)
                    .frame(width: 2, height: 20)
                Text("$ " + (String(format: "%.0f", currencyViewModel.usdAsBase)))
                    .font(.system(size: 16, weight: .semibold, design: Font.Design.rounded))
                    .foregroundColor(Color.white)
                Spacer()
                Text("₺ " + (String(format: "%.2f", currencyViewModel.usdToTry)))
                    .font(.system(size: 16, weight: .semibold, design: Font.Design.rounded))
                    .foregroundColor(Color.white)
                Spacer()
                if currencyViewModel.tr > currencyViewModel.tr {
                    Image(systemName: "arrow.down")
                        .foregroundColor(Color.red)
                } else if currencyViewModel.tr < currencyViewModel.tr {
                    Image(systemName: "arrow.up")
                        .foregroundColor(Color.green)
                } else {
                    Image(systemName: "minus")
                        .foregroundColor(Color(UIColor.systemGray6))
                }
                Spacer()
                Text("₺ " + (String(format: "%.2f", currencyViewModel.usdToTry)))
                    .font(.system(size: 14, weight: .semibold, design: Font.Design.rounded))
                    .foregroundColor(Color(UIColor.systemGray4))
                Spacer()

            }
            
            Divider()

            HStack {
                RoundedRectangle(cornerRadius: 1)
                    .fill(Color.blue)
                    .frame(width: 2, height: 20)
                Text("€ " + (String(format: "%.0f", currencyViewModel.eur)))
                    .font(.system(size: 16, weight: .semibold, design: Font.Design.rounded))
                    .foregroundColor(Color.white)
                Spacer()

                Text("₺ " + (String(format: "%.2f", currencyViewModel.tr)))
                    .font(.system(size: 16, weight: .semibold, design: Font.Design.rounded))
                    .foregroundColor(Color.white)
                Spacer()
                if currencyViewModel.tr > currencyViewModel.tr {
                    Image(systemName: "arrow.down")
                        .foregroundColor(Color.red)
                } else if currencyViewModel.tr < currencyViewModel.tr {
                    Image(systemName: "arrow.up")
                        .foregroundColor(Color.green)
                } else {
                    Image(systemName: "minus")
                        .foregroundColor(Color(UIColor.systemGray6))
                }
                Spacer()
                Text("₺ " + (String(format: "%.2f", currencyViewModel.tr)))
                    .font(.system(size: 14, weight: .semibold, design: Font.Design.rounded))
                    .foregroundColor(Color(UIColor.systemGray4))
                Spacer()
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)

    }
}


struct CurconMediumView_Previews: PreviewProvider {
    static var previews: some View {
        CurconMediumView(_currencyViewModel: CurrencyViewModel(currency: CurrencyModel(gbp: 0.0, usd: 0.0, eur: 0.0, tr: 0.0)))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
