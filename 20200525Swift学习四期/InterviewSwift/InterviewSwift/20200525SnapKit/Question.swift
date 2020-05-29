
//
//  Question.swift
//  InterviewSwift
//
//  Created by nixs on 2020/5/25.
//  Copyright © 2020 nixs. All rights reserved.
//

import Foundation

struct Question {
    let title:String
    let isTrue:Bool
}

let questions = [
    ("As far as has ever been reported, no-one has ever seen an ostrich bury its head in the sand.", true),
    ("Approximately one quarter of human bones are in the feet.", true),
    ("Popeye’s nephews were called Peepeye, Poopeye, Pipeye and Pupeye.", true),
    ("In ancient Rome, a special room called a vomitorium was available for diners to purge food in during meals.", false),
    ("The average person will shed 10 pounds of skin during their lifetime.", false),
    ("The Great Wall Of China is visible from the moon.", false),
    ("Virtually all Las Vegas gambling casinos ensure that they have no clocks.", true),
    ("Risotto is a common Italian rice dish.", true),
    ("The prefix \"mega-\" represents one million.", true),
    ("The \"Forbidden City\" is in Beijing.", true),
    ("Hurricanes and typhoons are the same thing.", true),
    ("In Shakespeare's play, Hamlet commits suicide.", false),
    ("An American was the first man in space.", false),
    ("The \"China Syndrome\" is what hostages experience when they begin to feel empathy for their captors.", false),
    ("Other than water, coffee is the world's most popular drink.", true)
    ].map(Question.init)

