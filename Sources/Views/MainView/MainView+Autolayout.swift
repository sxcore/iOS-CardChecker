extension MainView {

internal func configureAutolayout() {

    backgroundView.snp.makeConstraints { make -> Void in
        make.edges.equalToSuperview()
    }

    stackView.snp.makeConstraints { make -> Void in
        make.left.right.centerY.equalToSuperview()
    }

    containerView.snp.makeConstraints { make -> Void in
        make.height.equalTo(50)
        make.left.equalToSuperview().offset(5)
        make.right.equalToSuperview().offset(-5)
    }

    validationPendingView.snp.makeConstraints { make -> Void in
        make.edges.equalToSuperview()
    }

    validationPositiveView.snp.makeConstraints { make -> Void in
        make.edges.equalToSuperview()
    }

    validationNegativeView.snp.makeConstraints { make -> Void in
        make.edges.equalToSuperview()
    }

    creditCardControlView.snp.makeConstraints { make -> Void in
        make.height.equalTo(40)
        make.centerX.equalToSuperview()
    }

    generateButton.snp.makeConstraints { make -> Void in
        make.left.equalToSuperview().offset(20)
        make.right.equalToSuperview().offset(-20)
        make.height.equalTo(60)
    }

    validateButton.snp.makeConstraints { make -> Void in
        make.left.equalToSuperview().offset(20)
        make.right.equalToSuperview().offset(-20)
        make.height.equalTo(60)
    }

    }

}
