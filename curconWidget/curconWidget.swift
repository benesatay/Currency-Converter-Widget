//
//  curconWidget.swift
//  curconWidget
//
//  Created by Bahadır Enes Atay on 16.01.2021.
//

import WidgetKit
import SwiftUI



struct curconWidgetEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemMedium:
            CurconMediumView(_currencyViewModel: entry.currencyViewModel)
//        case .systemLarge:
//            CurconLargeView()
        default:
            fatalError()
        }
        //Text(entry.date, style: .time)
    }
}

@main
struct curconWidget: Widget {
    let kind: String = "curconWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            curconWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Currency Converter Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}

struct curconWidget_Previews: PreviewProvider {
    static var previews: some View {
        curconWidgetEntryView(entry: CurrencyEntry.mockupCurrencyEntry())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
