//
//  Provider.swift
//  curconWidgetExtension
//
//  Created by Bahadır Enes Atay on 16.01.2021.
//

import WidgetKit

struct Provider: TimelineProvider {
    let apiManager: ApiManager = ApiManager()
    typealias Entry = CurrencyEntry
    func placeholder(in context: Context) -> CurrencyEntry {
        CurrencyEntry.mockupCurrencyEntry()
    }

    func getSnapshot(in context: Context, completion: @escaping (CurrencyEntry) -> ()) {
        let entry = CurrencyEntry.mockupCurrencyEntry()

        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        

        let currencyModel = CurrencyModel(gbp: 0.0, usd: 0.0, eur: 0.0, tr: 0.0)
        var currencyViewModel = CurrencyViewModel(currency: currencyModel)
        apiManager.getCurrencyData { (currencyVM) in
            currencyViewModel = currencyVM
            
            let currentDate = Date()
            let entry = CurrencyEntry(date: currentDate, currencyViewModel: currencyViewModel)
            let refreshDate = Calendar.current.date(byAdding: .minute, value: 30, to: currentDate)!
            let timeLine = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeLine)
            
            
        } onError: { (error) in
            print(error)
        }


    }
}
