//
//  SwiftNewsModel.swift
//  RedditApp
//
//  Created by Vaibhav Munjal on 2020-08-08.
//  Copyright © 2020 vm. All rights reserved.
//

import Foundation

struct SwiftNewsModel: Codable {
    let kind: String
    let data: SwiftNewsModelData
}

struct SwiftNewsModelData: Codable {
    let modhash: String
    let dist: Int
    let children: [Child]
    let after, before: String?
}

struct Child: Codable {
    let kind: String
    let data: ChildData
}

// MARK: - ChildData
struct ChildData: Codable {
    let approved_at_utc, selftext, author_fullname: String?
    let subreddit: String
    let saved: Bool
    let mod_reason_title: String?
    let gilded: Int
    let clicked:Bool
    let title:String
    let link_flair_richtext: [String]
    let subreddit_name_prefixed: String?
    let hidden: Bool
    let pwls: Int
    let link_flair_css_class: String?
    let downs: Int
    let thumbnail_height: Int?
    let top_awarded_type: Int?
    let hide_score: Bool
    let name: String
    let quarantine: Bool
    let link_flair_text_color: String?
    let upvote_ratio: Double
    let author_flair_background_color, subreddit_type: String?
    let ups: Int
    let total_awards_received: Int?
    let media_embed: MediaEmbed?
    let thumbnail_width: Int?
    let author_flair_template_id: String?
    let is_original_content: Bool
    let user_reports: [String]?
    let secure_media: SecureMediaObject?
    let link_flair_text: String?
    let can_mod_post: Bool
    let score: Int
    let approved_by: String?
    let author_premium: Bool
    let thumbnail: String?
    let author_flair_css_class: String?
    let author_flair_richtext: [String]
    let gildings: Gildings
    let content_categories: String?
    let is_self: Bool
    let mod_note: String?
    let created: Int
    let link_flair_type: String?
    let wls: Int?
    let removed_by_category, banned_by, author_flair_type, domain: String?
    let allow_live_comments: Bool
    let selftext_html, likes, suggested_sort, banned_at_utc: String?
    let view_count: String?
    let archived, no_follow, is_crosspostable, pinned: Bool
    let over_18: Bool
    let media_only, can_gild, spoiler, locked: Bool
    let author_flair_text: String?
    let treatment_tags: [String]
    let visited: Bool
    let removed_by, num_reports, distinguished, subreddit_id: String?
    let mod_reason_by, removal_reason, link_flair_background_color, id: String?
    let is_robot_indexable: Bool
    let report_reasons, author, discussion_type: String?
    let num_comments: Int
    let send_replies: Bool
    let whitelist_status: String?
    let contest_mode: Bool
    let mod_reports: [String]
    let author_patreon_flair: Bool
    let author_flair_text_color, permalink, parent_whitelist_status: String?
    let stickied: Bool
    let url: String?
    let subreddit_subscribers, created_utc, num_crossposts: Int
    let media: SecureMediaObject?
    let is_video: Bool
    let preview: Preview?
    
}

struct Preview: Codable {
    let images: [Image]
    let enabled: Bool
}

struct Image: Codable {
    let source: Source
    let resolutions: [Source]
    let variants: Gildings
    let id: String
}

struct Source: Codable {
    let url: String
    let width, height: Int
}

struct MediaEmbed: Codable{
    let content: String?
    let width: Int?
    let scrolling: Bool?
    let height: Int?
    let media_domain_url: String?
}

struct Gildings: Codable {
}

struct SecureMediaObject: Codable {
    let type:String
    let oembed: Oembed
    
}

struct Oembed: Codable {
    let provider_url: String
    let version, title, type: String
    let thumbnail_width, height, width: Int
    let html, author_name, provider_name: String
    let thumbnail_url: String
    let thumbnail_height: Int
    let author_url: String
}
