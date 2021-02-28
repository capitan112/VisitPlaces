//
//  GCDBlackBox.swift
//  VisitPlace
//
//  Created by Oleksiy Chebotarov on 26/02/2021.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
