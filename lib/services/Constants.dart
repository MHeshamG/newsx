class Constants{

  static String TOP_HEADLINES_URL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=6b9b99189c2e44498d93feeb3015d601";

  static String getHEADLINES_BY_KEYWORD_URL(String keyword){
    return "https://newsapi.org/v2/everything?q=$keyword&from=2020-01-14&sortBy=publishedAt&apiKey=6b9b99189c2e44498d93feeb3015d601";
  }
}