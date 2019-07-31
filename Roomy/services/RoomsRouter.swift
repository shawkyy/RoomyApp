
import Foundation

import Foundation
import Alamofire

enum RoomsRouter: URLRequestConvertible {
    static let baseURLString = "https://roomy-application.herokuapp.com/"
    
    case signIn([String: Any])
    case signUp([String: Any])
    case getAllRooms([String: String])
    case addRooms([String: Any])
    
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .signIn:
                return .post
            case .signUp:
                return .post
            case .getAllRooms:
                return .get
            case .addRooms:
                return .post
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case .signIn(let userSignInCredentials):
                return userSignInCredentials
            case.signUp(let userSignUpCredentials):
                return userSignUpCredentials
            case.getAllRooms(let userRooms):
                return userRooms
            case .addRooms(let newRoom):
                return (newRoom)
            }
        }()
        
        let headers: (HTTPHeaders?) = {
            switch self{
            case .getAllRooms(let headers):
                return HTTPHeaders(headers)
            default:
                return nil
            }
        }()
        
        let url: URL = {
            // build up and return the URL for each endpoint
            let relativePath: String?
            switch self {
            case .signIn:
                relativePath = "auth/login"
            case .signUp:
                relativePath = "signup"
            case .getAllRooms:
                relativePath = "rooms"
            case .addRooms:
                relativePath = "rooms"
            }
            
            var url = URL(string: RoomsRouter.baseURLString)!
            if let relativePath = relativePath {
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()
        
        
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.headers = headers ?? urlRequest.headers
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        return try encoding.encode(urlRequest, with: params)
    }
}

