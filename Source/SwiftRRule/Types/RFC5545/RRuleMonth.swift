//
//  RRuleMonth.swift
//  SwiftRRule
//
//  Created by Joshua Morris on 1/16/21.
//

import Foundation
import SwiftDate

// Zero-indexed, unlike SwiftDate's Month. Makes math less painful.
public enum RRuleMonth: Number {
    case
        january = 1,
        february,
        march,
        april,
        may,
        june,
        july,
        august,
        september,
        october,
        november,
        december
}

extension RRuleMonth: Comparable {
    private static func minimum(_ lhs: Self, _ rhs: Self) -> Self {
        switch (lhs, rhs) {
        case (.january, _), (_, .january):
            return .january
        case (.february, _), (_, .february):
            return .february
        case (.march, _), (_, .march):
            return .march
        case (.april, _), (_, .april):
            return .april
        case (.may, _), (_, .may):
            return .may
        case (.june, _), (_, .june):
            return .june
        case (.july, _), (_, .july):
            return .july
        case (.august, _), (_, .august):
            return .august
        case (.september, _), (_, .september):
            return .september
        case (.october, _), (_, .october):
            return .october
        case (.november, _), (_, .november):
            return .november
        case (.december, _), (_, .december):
            return .december
        }
    }

    public static func < (lhs: RRuleMonth, rhs: RRuleMonth) -> Bool {
        return (lhs != rhs) && (lhs == Self.minimum(lhs, rhs))
    }
}

extension RRuleMonth: MonthInterop {
    var month: Month {
        switch (self) {
        case .january: return .january
        case .february: return .february
        case .march: return .march
        case .april: return .april
        case .may: return .may
        case .june: return .june
        case .july: return .july
        case .august: return .august
        case .september: return .september
        case .october: return .october
        case .november: return .november
        case .december: return .december
        }
    }
}

extension RRuleMonth: Flattenable {
    public typealias T = Self

    public func flattened() -> Multi<Number> {
        return Multi([self.rawValue])
    }
}
