//
//  ClaudeCredentials.swift
//  OpenQuartz
//
//  Created by Abhiram Krishna M on 05/08/26.
//

import Foundation

struct ClaudeCredentials: Decodable {
    let claudeAiOauth: OAuthTokens
}

struct OAuthTokens: Decodable {
    let accessToken: String
}
