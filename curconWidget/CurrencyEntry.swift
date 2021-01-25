//
//  CurrencyEntry.swift
//  curconWidgetExtension
//
//  Created by Bahadır Enes Atay on 16.01.2021.
//

import WidgetKit

struct CurrencyEntry: TimelineEntry {
    let date: Date
    let currencyViewModel: CurrencyViewModel

    static func mockupCurrencyEntry() -> CurrencyEntry {
        let apiManager = ApiManager()
        let currency = CurrencyModel(gbp: 0.0, usd: 0.0, eur: 0.0, tr: 0.0)
        var currencyVModel = CurrencyViewModel(currency: currency)
        apiManager.getCurrencyData { (currencyVM) in
            currencyVModel = currencyVM
        } onError: { (error) in
            print(error)
        }
        return CurrencyEntry(date: Date(), currencyViewModel: currencyVModel)
    }

}

 
