//
//  ViewController.m
//  ProjectObjectiveC
//
//  Created by Lilian on 19/07/2019.
//  Copyright © 2019 Lilian ALVAREZ. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *adresseBarTextField;
@property (strong, nonatomic) IBOutlet UIStackView *stackView;
@property (weak, nonatomic) WKWebView *activeWebView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setDefaultTitle];

    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target: self action:@selector(addWebView)];
    UIBarButtonItem *delete = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemTrash target: self action:@selector(deleteWebView)];

    self.navigationItem.rightBarButtonItems = @[delete, add];
}

- (void)setDefaultTitle {
    self.title = @"Multi navigateur Zone de chasse";
}

- (void)addWebView {
    WKWebView *webView = [WKWebView new];
    webView.navigationDelegate = self;

    [self.stackView addArrangedSubview: webView];

    NSURL *url = [NSURL URLWithString: @"https://www.zonedechasse.com"];
    [webView loadRequest: [NSURLRequest requestWithURL: url]];

    webView.layer.borderColor = [[UIColor blueColor] CGColor];
    [self selectWebView: webView];

    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(webViewTapped:)];
    recognizer.delegate = self;
    [webView addGestureRecognizer: recognizer];


}

- (void)deleteWebView {
    if (self.activeWebView == nil) return;

    NSUInteger index = [self.stackView.arrangedSubviews indexOfObject: self.activeWebView];
    [self.stackView removeArrangedSubview: self.activeWebView];
    [self.activeWebView removeFromSuperview];

    if ([self.stackView.arrangedSubviews count] == 0) {
        [self setDefaultTitle];
    } else {
        if (index == self.stackView.arrangedSubviews.count) {
            index = self.stackView.arrangedSubviews.count - 1;
        }
        WKWebView *webView = (WKWebView*)self.stackView.arrangedSubviews[index];
        [self selectWebView: webView];
    }
}

- (void)selectWebView:(WKWebView*)webView {
    for (UIView *vw in self.stackView.arrangedSubviews) {
        vw.layer.borderWidth = 0;
    }

    self.activeWebView = webView;
    webView.layer.borderWidth = 3;
}

- (void)webViewTapped:(UITapGestureRecognizer*)recognizer {
    WKWebView *webView = (WKWebView*)recognizer.view;
    [self selectWebView: webView];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSURL *url = [NSURL URLWithString: self.adresseBarTextField.text];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL: url];
    [self.activeWebView loadRequest: urlRequest];

    [textField resignFirstResponder];
    return YES;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact) {
        self.stackView.axis = UILayoutConstraintAxisVertical;
    } else  {
        self.stackView.axis = UILayoutConstraintAxisHorizontal;
    }
}

@end
