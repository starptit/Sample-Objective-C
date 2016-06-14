//
//  APIConnectManager.h
//  Sample Project
//
//  Created by _Genesis_ on 6/13/16.
//  Copyright © 2016 Genesis. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    GET,
    POST,
    PUT,
    PATCH,
    DELETE
}HTTPMethod;

@interface APIConnectManager : NSObject

#pragma mark - Public static methods

/**
 *  Create `APIConnectManager` shared instance
 *
 *  @return A shared instance valid of the `DownloadManager`
 */
+ (id)sharedInstance;

// ------------------------------------------------------------------------
// Public instance methods
// ------------------------------------------------------------------------
#pragma mark - Public instance methods

/**
 *  Send API To Server and receive Data
 *
 *  @param pathUrl     URL Path of connect
 *  @param httpType HTTP Method want to send
 *  @param sendData payload want to send to server
 *  @param block success - call back whenever server return without error
 *  @param block failuer - callback whenever server return fail or error occur
 */
-(void) requestToServer:(NSString *)pathUrl
                withMethod:(HTTPMethod)httpType postData:(NSDictionary *)sendData
                success:(void(^)(NSMutableDictionary *success))success
                failure:(void(^)(NSError *error))failure;


/**
 * Upload Data MIME type to Server
 *
 *  @param pathUrl     URL Path of connect
 *  @param sendData payload want to send to server
 *  @param assets array of MIME type send to server (array of images/ videos)
 *  @param block success - call back whenever server return without error
 *  @param block failuer - callback whenever server return fail or error occur
 */

-(void)uploadToServer:(NSString *)pathUrl withData:(NSDictionary *)sendData andImageAssets:(NSArray *)assets success:(void(^)(NSMutableDictionary *success))success
              failure:(void(^)(NSError *error))failure;

@end
