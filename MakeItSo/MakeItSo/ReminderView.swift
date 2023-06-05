//
//  ReminderView.swift
//  MakeItSo
//
//  Created by andrew austin on 6/5/23.
//

import SwiftUI

struct ReminderView: View {
    @State
    private var reminder = Reminder(title: "")
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $reminder.title)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {}) {
                        Text("Add")
                    }
                }
            }
        }
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
