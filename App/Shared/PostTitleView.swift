//
//  PostTitleView.swift
//  Hackers
//
//  Created by Weiran Zhang on 12/07/2015.
//  Copyright © 2015 Weiran Zhang. All rights reserved.
//

import UIKit

class PostTitleView: UIView, UIGestureRecognizerDelegate {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var metadataLabel: UILabel!

    var isTitleTapEnabled = false

    var post: Post? {
        didSet {
            guard let post = post else { return }
            titleLabel.text = post.title
            titleLabel.accessibilityIdentifier = "postTitleLable"
            metadataLabel.attributedText = metadataText(for: post)
            metadataLabel.accessibilityIdentifier = "metadataLabel"
        }
    }

    private func domainLabelText(for post: Post) -> String {
        guard
            let urlComponents = URLComponents(url: post.url, resolvingAgainstBaseURL: false),
            var host = urlComponents.host else {
            return "news.ycombinator.com"
        }

        if host.starts(with: "www.") {
            host = String(host[4...])
        }

        return host
    }

    private func metadataText(for post: Post) -> NSAttributedString {
        let defaultAttributes = [NSAttributedString.Key.foregroundColor: AppTheme.default.textColor]
        var pointsAttributes = defaultAttributes
        var pointsTintColor: UIColor?

        if post.upvoted {
            pointsAttributes = [NSAttributedString.Key.foregroundColor: AppTheme.default.upvotedColor]
            pointsTintColor = AppTheme.default.upvotedColor
        }

        let pointsIconAttachment = textAttachment(for: "PointsIcon", tintColor: pointsTintColor)
        let pointsIconAttributedString = NSAttributedString(attachment: pointsIconAttachment)

        let commentsIconAttachment = textAttachment(for: "CommentsIcon", tintColor: AppTheme.default.textColor)
        let commentsIconAttributedString = NSAttributedString(attachment: commentsIconAttachment)

        let string = NSMutableAttributedString()
        string.append(NSAttributedString(string: "\(post.score)", attributes: pointsAttributes))
        string.append(pointsIconAttributedString)
        string.append(NSAttributedString(string: "• \(post.commentsCount) ", attributes: defaultAttributes))
        string.append(commentsIconAttributedString)
        string.append(NSAttributedString(string: " • \(domainLabelText(for: post))", attributes: defaultAttributes))
        return string
    }

    private func templateImage(named: String, tintColor: UIColor? = nil) -> UIImage? {
        let image = UIImage.init(named: named)
        var templateImage = image?.withRenderingMode(.alwaysTemplate)
        if let tintColor = tintColor {
           templateImage = templateImage?.withTintColor(tintColor)
        }
        return templateImage
    }

    private func textAttachment(for imageNamed: String, tintColor: UIColor? = nil) -> NSTextAttachment {
        let attachment = NSTextAttachment()
        guard let image = templateImage(named: imageNamed, tintColor: tintColor) else { return attachment }
        attachment.image = image
        attachment.bounds = CGRect(x: 0, y: -2, width: image.size.width, height: image.size.height)
        return attachment
    }
}
