kido-ios-blank Version 1.1.1
=====================================

This is a sample project that will provide a quick overview of how to connect to the KidoZen platform.


Usage
=====

In the AppDelegate ":didFinishLaunchingWithOptions" method, we invoque a simple ready to used conection Manager. 
This class will keep a running instance of the KZApplication object and KZResponse, this class also defines
a protocol delegate that sends the response back on a sucessful connection:

_kidoZenConector = [[KZConnectionManager alloc] init];
_kidoZenConector.delegate = self;


Replace the definitions in the folowing classes:

KZBlankSampleViewController.m

// Replace the definition keys pointing to your tennant server instance:

 #define KidoZenAppCenterUrl @"https://yourAccount.kidocloud.com"
 
 #define KidoZenAppName @"theAppName"
 
 #define KidoZenProvider @"Your Provider"
 
 #define KidoZenUser @"yourAccount@kidozen.com"
 
 #define KidoZenPassword @"???????"
 

