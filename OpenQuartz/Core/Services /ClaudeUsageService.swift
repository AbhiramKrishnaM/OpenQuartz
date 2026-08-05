//
//  ClaudeUsageService.swift
//  OpenQuartz
//
//  Created by Abhiram Krishna M on 05/08/26.
//

import Foundation

struct ClaudeUsageService{
    func fetchUsage(accessToken: String) async throws -> ClaudeUsageResponse{
        let url = URL(string: "https://api.anthropic.com/api/oauth/usage")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("oauth-2025-04-20", forHTTPHeaderField: "anthropic-beta")
        request.setValue("claude-code/2.1.0", forHTTPHeaderField:"User-Agent")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        let decoder = JSONDecoder()
        let usage = try decoder.decode(ClaudeUsageResponse.self, from: data)
        return usage
    }
}

