//
//  ChatView.swift
//  Messenger
//
//  Created by Afraz Siddiqui on 4/17/21.
//

import SwiftUI

struct CustomField: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(7)
    }
}

struct ChatView: View {
    @State var message: String = ""
    @EnvironmentObject var model: AppStateModel
    let otherUsername: String

    init(otherUsername: String) {
        self.otherUsername = otherUsername
    }

    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ForEach(model.messages, id: \.self) { message in
                    ChatRow(text: message.text,
                            type: message.type)
                        .padding(3)
                }
            }

            // Field, send button
            HStack {
                TextField("Message...", text: $message)
                    .modifier(CustomField())

                SendButton(text: $message)
            }
            .padding()
        }
        .navigationBarTitle(otherUsername, displayMode: .inline)
        .onAppear {
            model.otherUsername = otherUsername
            model.observeChat()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(otherUsername: "Samantha")
            .preferredColorScheme(.dark)
    }
}
