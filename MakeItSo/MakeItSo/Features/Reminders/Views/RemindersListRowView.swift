//
//  RemindersListRowView.swift
//  MakeItSo
//
//  Created by andrew austin on 6/7/23.
//

import SwiftUI

struct RemindersListRowView: View {
    @Binding
    var reminder: Reminder
    
    var body: some View {
        HStack {
            Image(systemName: reminder.isCompleted
                  ? "largecircle.fill.circle"
                  : "circle")
            .imageScale(.large)
            .foregroundColor(.accentColor)
            .onTapGesture {
                reminder.isCompleted.toggle()
            }
            Text(reminder.title)
        }
    }
}

struct RemindersListRowView_Previews: PreviewProvider {
    struct Container: View {
        @State var reminder = Reminder.samples[0]
        
        var body: some View {
            List {
                RemindersListRowView(reminder: $reminder)
            }
            .listStyle(.plain)
        }
    }
    
    static var previews: some View {
        NavigationView {
            Container()
                .navigationTitle("Reminders")
        }
    }
}
