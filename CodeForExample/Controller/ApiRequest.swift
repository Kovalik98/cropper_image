//
//  ViewController.swift
//  Jsont
//
//  Created by Nazar Kovalyk on 02.05.2021.
//

import Alamofire

struct Type {
    var templateArray: _Template
}



struct Type3 {
    var shots: _Shot
}
 

class ApiRequest{

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        getRequestAPICall(url: "https://api.momenzo.com/templates/batch?updatesFrom=&includeShots=true&lang=uk")
//    }
    
    func getRequestAPICall(url: String)  {
       
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: [
            "Authorization": "JWT eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlcyI6W10sImNtcCI6WyJpdHVuZXMiXSwiaWF0IjoxNjE5OTc4NTMzLCJleHAiOjE2MTk5NzkxMzMsInN1YiI6InVzcl8wMWJmMjMzZWIzN2Y1ZWJhODk5MTBiZmFmNzgyZmJjMiJ9.E8wkuGaCz3CKni2diJrJ98zmLTsVOnCqA0b9QC87i9Nzpw6f9SpCVWwn1YBer__F9emjcl_P13hVlT7qBTkOsWeRrjt5DkFy8Yq9OaWMrtBGr4cFwUFQq8ic0fuvTzojSYApoOJ9p05Hg2lnKduVrpoZ-Q636C8__LMg3wSS7ZOPEiJ7lSZt-qdff-3sh96x3FQWL55gk3H9SBpIbt4cKGQLGCMttHHu8qTfOWnQ8oGBgX9F0W74eXdVbaakXKYfT49GnDZwAoB0PKSU0tuGXSgyx-wbtW1shpVPfl2Cqv3fGFPqPcxG9o4N2j1GSHpDzHA6LGn60WbJAMmjn7cIothQ7J1OJo_N1MquJJv5ZnLSIp6wPTWYyRzjG--TyxB_unj5HBcbqCDzzqXMVpDzEODqWubplF_bLZeP4gGUSXO8V0qHjkDTVbGJoUu3tdRlKqcE3qjeZpbpFZCcQg-zjd5DQYK5IbXD3ow5qvhj2e7xhnE54-tsf56dIydEJQmmoMuU5t3AmtBuw3sfgKWOMOQ7u7a3vz9fdMTVCmevFqmgwBKFsu2COoPV9sS2RRaxxEOEPR33p9NbqIuE44rFteR-0kEjw2p6q0Jq72OrjDbzAIIeoJvdilZvL5dZ3weDz2DDo4kXsFCHYvT_fMw5KubqoCDRR-1PxFTqx3LqNQ8",
        ])
                .responseData { response in // note the change to responseData
                    switch response.result {
                    case .failure(let error):
                        print(error)
                    case .success(let data):
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let result = try! decoder.decode(_Templatet.self, from: data)
                            let templetet = result.templates!
                            templetet.forEach { (templetet) in
                                Type(templateArray: templetet)
                                }
                        
                            let shots = result.shots!
                            shots.forEach { (templetet) in
                                Type3(shots: templetet)
                                }
                            
//                            print(templetet?.forEach({$0.id}))
                            
                        } catch { print(error) }
                    }
            }
        }
}
