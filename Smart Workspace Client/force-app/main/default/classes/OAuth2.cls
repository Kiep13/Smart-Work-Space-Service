public class OAuth2{
    public String id{get;set;}
    public String issued_at{get;set;}
    public String instance_url{get;set;}
    public String signature{get;set;}
    public String access_token{get;set;} 
    
    public OAuth2(String id, String issued_at, String instance_url, String signature, String access_token) {
        this.id = id;
        this.issued_at = issued_at;
        this.instance_url = instance_url;
        this.signature = signature;
        this.access_token = access_token;
    }
}