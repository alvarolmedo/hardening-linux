class domestic{
  class{'domestic::packages': }
  -> 
  class{'domestic::config': }
  -> 
  class{'domestic::services': }
}
