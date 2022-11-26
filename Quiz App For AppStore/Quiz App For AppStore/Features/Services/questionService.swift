import Foundation


class  questionAppService {

    static let shared = questionAppService()
   
    
    let url = URL(string: "https://raw.githubusercontent.com/ardacmen/LoL-Quiz-App-/main/questions")
    
     func fetchAllDatas(response: @escaping ([questionn]?) -> Void)
    {
        let request = URLRequest(url: url!)
            
               
               let task = URLSession.shared.dataTask(with: request){data, responsee, error in
                         guard let data = data else {
                             print("Request Error")
                             return }
                         do {
                            
                             let someThing = try JSONDecoder().decode([questionn].self, from: data)
                             
                             
                             response(someThing)
                            
                             
                         } catch {
                             print(error) }
                     }
                   
                     task.resume()
                     
         
    }

}
