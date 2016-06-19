//
//  APIConnectManager.m
//  Sample Project
//
//  Created by _Genesis_ on 6/13/16.
//  Copyright © 2016 Genesis. All rights reserved.
//

#import "APIConnectManager.h"
#import <AFNetworking/AFNetworking.h>


@implementation APIConnectManager


// ------------------------------------------------------------------------
// Public static methods
// ------------------------------------------------------------------------
#pragma mark - Public static methods

- (instancetype)init {
    self = [super init];
    if (self) {
        
        // init with some properties
        
    }
    return self;
}

+ (id)sharedInstance {
    static dispatch_once_t once;
    static APIConnectManager *sharedInstance = nil;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

// ------------------------------------------------------------------------
// Public instance methods
// ------------------------------------------------------------------------
#pragma mark - Public instance methods

-(void) requestToServer:(NSString *)pathUrl
             withMethod:(HTTPMethod)httpType postData:(NSDictionary *)sendData
                success:(void(^)(NSMutableDictionary *success))success
                failure:(void(^)(NSError *error))failure
{
    
    pathUrl = [NSString stringWithFormat:@"%@/%@",BASE_URL,pathUrl];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //=========== set request for AFNetWorking ===============
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    //  [requestSerializer setValue:SharedAppDelegate.user.cookie forHTTPHeaderField:@"Cockie"];
    requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithObjects:@"GET", @"HEAD", nil];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.requestSerializer = requestSerializer;
    
    //============ set response for AFNetworking =============
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    switch (httpType) {
            //case send GET Request
        case GET:{
            
            [manager GET:pathUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
                if([responseObject isKindOfClass:[NSMutableDictionary class]]){
                    dic = [[NSMutableDictionary alloc] initWithDictionary:responseObject];
                }
                
                /*
                 if(responseObject != nil){
                 NSData *data = (NSData *)responseObject;
                 NSString *stringData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                 
                 dic = (NSMutableDictionary *)[self jsonFromString:stringData];
                 }
                 */
                
                success(dic);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure(error);
            }];
            
            break;
        }
            
        case POST:
        {
            [manager POST:pathUrl parameters:sendData progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
                if([responseObject isKindOfClass:[NSMutableDictionary class]]){
                    dic = [[NSMutableDictionary alloc] initWithDictionary:responseObject];
                }
                
                success(dic);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure(error);
            }];
            
            break;
        }
            
        case PUT:
        {
            [manager PUT:pathUrl parameters:sendData success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
                if([responseObject isKindOfClass:[NSMutableDictionary class]]){
                    dic = [[NSMutableDictionary alloc] initWithDictionary:responseObject];
                }
                
                success(dic);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure(error);
            }];
            
            break;
        }
            
        case PATCH:
        {
            [manager PATCH:pathUrl parameters:sendData success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
                if([responseObject isKindOfClass:[NSMutableDictionary class]]){
                    dic = [[NSMutableDictionary alloc] initWithDictionary:responseObject];
                }
                
                success(dic);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure(error);
            }];
            
            break;
        }
            
        case DELETE:
        {
            [manager DELETE:pathUrl parameters:sendData success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
                if([responseObject isKindOfClass:[NSMutableDictionary class]]){
                    dic = [[NSMutableDictionary alloc] initWithDictionary:responseObject];
                }
                
                success(dic);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure(error);
            }];
            
            break;
        }
            
        default:
            break;
    }
    

}


-(void)uploadToServer:(NSString *)pathUrl withData:(NSDictionary *)sendData andImageAssets:(NSArray *)assets success:(void(^)(NSMutableDictionary *success))success
              failure:(void(^)(NSError *error))failure{
    

    
    pathUrl = [NSString stringWithFormat:@"%@/%@",BASE_URL,pathUrl];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:pathUrl]];
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:sendData forKey:@"data"];
    
    NSURLSessionDataTask *op = [manager POST:pathUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //do not put image inside parameters dictionary as I did, but append it!
        /*
        if(assets != nil && assets.count > 0){
            for (DKAsset *asset in assets) {
                [asset fetchFullScreenImage:YES completeBlock:^(UIImage * image, NSDictionary * info) {
                    NSData *imageData = UIImageJPEGRepresentation(image, 1);
                    [formData appendPartWithFileData:imageData name:@"file[]" fileName:[info objectForKey:@"PHImageFileURLKey"] mimeType:@"image/jpeg"];
                }];
            }
        }
         */
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        if([responseObject isKindOfClass:[NSMutableDictionary class]]){
            dic = [[NSMutableDictionary alloc] initWithDictionary:responseObject];
        }
        
        success(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];

    [op resume];

}

-(NSDictionary *)jsonFromString:(NSString *)stringRaw{
    NSData *data = [stringRaw dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonConvert = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    return jsonConvert;
}

@end
