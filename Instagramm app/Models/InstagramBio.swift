// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let instagramBio = try? newJSONDecoder().decode(InstagramBio.self, from: jsonData)

import Foundation

// MARK: - InstagramBio
struct InstagramBio: Codable {
    let loggingPageID: String?
    let graphql: Graphql?

    enum CodingKeys: String, CodingKey {
        case loggingPageID = "logging_page_id"
        case graphql
    }
}

// MARK: - Graphql
struct Graphql: Codable {
    let user: GraphqlUser?
}

// MARK: - GraphqlUser
struct GraphqlUser: Codable {
    let biography: String?
    let blockedByViewer: Bool?
    let countryBlock: Bool?
    let followedByViewer: Bool?
    let followsViewer: Bool?
    let fullName: String?
    let hasArEffects, hasClips, hasGuides, hasChannel: Bool?
    let hasBlockedViewer: Bool?
    let highlightReelCount: Int?
    let hasRequestedViewer: Bool?
    let id: String?
    let isBusinessAccount, isJoinedRecently: Bool?
    let isPrivate, isVerified: Bool?
    let profilePicURL, profilePicURLHD: String?
    let requestedByViewer: Bool?
    let username: String?
    let edgeFelixVideoTimeline, edgeOwnerToTimelineMedia: EdgeFelixVideoTimelineClass?

    enum CodingKeys: String, CodingKey {
        case biography
        case blockedByViewer = "blocked_by_viewer"
        case countryBlock = "country_block"
        case followedByViewer = "followed_by_viewer"
        case followsViewer = "follows_viewer"
        case fullName = "full_name"
        case hasArEffects = "has_ar_effects"
        case hasClips = "has_clips"
        case hasGuides = "has_guides"
        case hasChannel = "has_channel"
        case hasBlockedViewer = "has_blocked_viewer"
        case highlightReelCount = "highlight_reel_count"
        case hasRequestedViewer = "has_requested_viewer"
        case id
        case isBusinessAccount = "is_business_account"
        case isJoinedRecently = "is_joined_recently"
        case isPrivate = "is_private"
        case isVerified = "is_verified"
        case profilePicURL = "profile_pic_url"
        case profilePicURLHD = "profile_pic_url_hd"
        case requestedByViewer = "requested_by_viewer"
        case username
        case edgeFelixVideoTimeline = "edge_felix_video_timeline"
        case edgeOwnerToTimelineMedia = "edge_owner_to_timeline_media"
    }
}

// MARK: - EdgeFelixVideoTimelineClass
struct EdgeFelixVideoTimelineClass: Codable {
    let count: Int?
    let edges: [EdgeFelixVideoTimelineEdge]?

    enum CodingKeys: String, CodingKey {
        case count
        case edges
    }
}

// MARK: - EdgeFelixVideoTimelineEdge
struct EdgeFelixVideoTimelineEdge: Codable {
    let node: Node?
}

// MARK: - Node
struct Node: Codable {
    let id, shortcode: String?
    let displayURL: String?
    let mediaPreview: String?
    let isVideo: Bool?
    let accessibilityCaption: String?
    let commentsDisabled: Bool?
    let takenAtTimestamp: Int?
    let thumbnailSrc: String?

    enum CodingKeys: String, CodingKey {
        case id, shortcode
        case displayURL = "display_url"
        case mediaPreview = "media_preview"
        case isVideo = "is_video"
        case accessibilityCaption = "accessibility_caption"
        case commentsDisabled = "comments_disabled"
        case takenAtTimestamp = "taken_at_timestamp"
        case thumbnailSrc = "thumbnail_src"
    }
}
