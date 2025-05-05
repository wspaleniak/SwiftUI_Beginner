//
//  DatePickerExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 19/02/2024.
//

import SwiftUI

struct DatePickerExample: View {
    
    // MARK: - Properties
    @State private var selectedDate: Date = .now
    
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2024)) ?? .now
    let endingDate: Date = .now
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        return formatter
    }
    
    // MARK: - View
    var body: some View {
        VStack {
            Text(dateFormatter.string(from: selectedDate))
                .font(.headline)
                .padding(.bottom, 30)
            
            // Whole date
            DatePicker(
                "Select a date",
                selection: $selectedDate
            )
            .datePickerStyle(.automatic)
            .tint(.green)
            
            // Only date
            DatePicker(
                "Select only date",
                selection: $selectedDate,
                displayedComponents: .date
            )
            .datePickerStyle(.automatic)
            .tint(.orange)
            
            // Only time
            DatePicker(
                "Select only time",
                selection: $selectedDate,
                displayedComponents: .hourAndMinute
            )
            .datePickerStyle(.automatic)
            .tint(.purple)
            
            // Whole date with closed range
            DatePicker(
                "Closed range",
                selection: $selectedDate,
                in: startingDate...endingDate,
                displayedComponents: [.date, .hourAndMinute]
            )
            .datePickerStyle(.automatic)
            .tint(.indigo)
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    DatePickerExample()
}
