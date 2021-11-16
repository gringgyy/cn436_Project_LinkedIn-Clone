//
//  ChatView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 13/11/2564 BE.
//

import SwiftUI

struct ChatView: View {
    @State var message = ""
    
    @ObservedObject var viewModel: ChatViewModel
    
    init(user: User) {
        viewModel = ChatViewModel(user: user)
    }
    
    @State var scrolled = false
    
    var body: some View {
        VStack {
            ScrollViewReader { reader in
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.messages) { message in
                            ChatRowView(message: message)
                                .onAppear {
                                    if message.id == viewModel.messages.last?.id && !scrolled {
                                        reader.scrollTo(viewModel.messages.last?.id, anchor: .bottom)
                                    }
                                }
                        }
                        .onChange(of: viewModel.messages) { _ in
                            reader.scrollTo(viewModel.messages.last?.id, anchor: .bottom)
                        }
                    }
                }
                
            }
            ChatInputView(message: $message, action: sendMessage)
        }
    }
    
    func sendMessage() {
        viewModel.sendMessage(message: message)
        message = ""
    }
}

