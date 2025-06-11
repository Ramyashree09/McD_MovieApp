//
//  Untitled.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/29/25.
//

import SwiftUI

struct CharacterQuotesView : View {
    @StateObject private var quotesViewModel: QuotesViewModel<QuotesService>
    @Binding var movieId : String
    @Binding var pagination : Bool
    var characterDetail : CharacterDetail?
    
    init(characterDetail: CharacterDetail? = nil,
         movieId: Binding<String>, pagination: Binding<Bool>) {
        let quotesUseCase = FetchDataUseCase(service: QuotesService())
        _quotesViewModel = StateObject(wrappedValue: QuotesViewModel(quotesUseCase:
                                                                        quotesUseCase))
        self.characterDetail = characterDetail
        _movieId = movieId
        _pagination = pagination
    }
    
    var body: some View {
        VStack {
            Text("NAME : \(characterDetail?.name ?? "")")
            Text("GENDER : \(characterDetail?.gender ?? "")")
            Text("")
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.clear)
        .bold()
        Spacer()
        VStack {
            QuotesView()
        }
        .onAppear {
            Task {
                pagination = false
                await quotesViewModel.fetchQuotesList()
                quotesViewModel.filteredQuotesList = await quotesViewModel.filterQuotesByID(movieID: movieId, characterID: characterDetail?.id ?? "")
            }
        }
    }
}

extension CharacterQuotesView {
    @ViewBuilder
    private func QuotesView() -> some View {
        if FlagConstant.isFlagged {
            Text("\(quotesViewModel.filteredQuotesList.count) Quotes Found")
                .bold()
            List(quotesViewModel.filteredQuotesList, id: \.self) {
                quote in
                Text("Quote : \(quote.dialog)")
                    .lineLimit(nil)
                    .listRowBackground(AppColors.appTheme)
            }
            .listRowSpacing(10)
        } else {
            Spacer()
            Text("Quotes feature is disabled")
                .font(.headline)
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

#Preview {
    CharacterQuotesView(movieId: .constant(""), pagination: .constant(false))
}
