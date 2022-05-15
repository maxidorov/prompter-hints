//
//  HintModel.swift
//  PrompterHints
//
//  Created by MSP on 27.04.2022.
//

import Foundation

struct HintModel: Identifiable, Codable, Equatable {
  let id: Int
  let text: String
  let date: Date
}

extension HintModel {
  static let mock = HintModel(
    id: 0,
    text:
      // swiftlint:disable line_length
    NSLocalizedString("""
    A teleprompter
    also known as an autocue, is a display device that prompts the person speaking with an electronic visual text of a speech or script. Using a teleprompter is similar to using cue cards. The screen is in front of, and usually below, the lens of a professional video camera, and the words on the screen are reflected to the eyes of the presenter using a sheet of clear glass or other beam splitter, so that they are read by looking directly at the lens position, but are not imaged by the lens. Light from the performer passes through the front side of the glass into the lens, while a shroud surrounding the lens and the back side of the glass prevents unwanted light from entering the lens. Mechanically this works in a very similar way to the "Pepper's Ghost" illusion from classic theatre: an image viewable from one angle but not another.

    Because the speaker can look straight at the lens while reading the script, the teleprompter creates the illusion that the speaker has memorized the speech or is speaking spontaneously, looking directly into the camera lens. Notes or cue cards, on the other hand, require the presenter to look at them instead of at the lens, which leaves an impression of distraction.

    The technology has continued to develop. From the first mechanical paper roll teleprompters used by television presenters and speakers at U.S. political conventions in 1952,[1] to dual glass teleprompters used by TV presenters and for U.S. conventions in 1964,[2] to the computer-based rolls of 1982 and the four-prompter system for U.S. conventions which added a large off-stage confidence monitor and inset lectern monitor in 1996,[3] to the replacement of glass teleprompters at U.K. political conferences by several large off-stage confidence monitors in 2006.[4]
    """, comment: "text for settings")
    ,
    date: Date()
  )
}
