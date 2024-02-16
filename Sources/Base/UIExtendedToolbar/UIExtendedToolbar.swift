//
//  UIExtendedToolbar.swift
//  UIExtendedToolbar
//
//  Created by Seb Vidal on 16/02/2024.
//

import UIKit

open class UIExtendedToolbar: UIToolbar {
    // MARK: - Private Properties
    private var toolbarContentView: UIView? {
        return subviews.first { subview in
            String(describing: type(of: subview)) == String(base64: "X1VJVG9vbGJhckNvbnRlbnRWaWV3")
        }
    }
    
    // MARK: - Public Properties
    open private(set) var contentView: UIView!
    
    // MARK: - init(frame:)
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
    }
    
    // MARK: - init(coder:)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupContentView() {
        contentView = UIView()
        contentView.clipsToBounds = true
        contentView.backgroundColor = .clear
        
        addSubview(contentView)
    }
    
    private func layoutExtendedToolbarContentView() {
        let targetSize = CGSize(width: frame.width, height: 800)
        let width = frame.width
        let height = contentView.systemLayoutSizeFitting(targetSize).height
        contentView.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    private func layoutToolbarContentView() {
        if let toolbarContentView {
            let x: CGFloat = 0
            let y = contentView.frame.height
            let width = frame.width
            let height = frame.height - y
            toolbarContentView.frame = CGRect(x: x, y: y, width: width, height: height)
        }
    }
    
    // MARK: - layoutSubviews()
    open override func layoutSubviews() {
        super.layoutSubviews()
        layoutExtendedToolbarContentView()
        layoutToolbarContentView()
    }
    
    // MARK: - sizeThatFits(_:)
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        let sizeThatFits = super.sizeThatFits(size)
        let additionalHeight = contentView.systemLayoutSizeFitting(sizeThatFits).height
        let totalHeight = sizeThatFits.height + additionalHeight
        
        return CGSize(width: sizeThatFits.width, height: totalHeight)
    }
}
