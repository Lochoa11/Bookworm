//
//  String-EmptyChecking.swift
//  Bookworm
//
//  Created by Lin Ochoa on 1/14/25.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
