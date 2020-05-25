import ArgumentParser


struct Random: ParsableCommand {
  static let configuration = CommandConfiguration(abstract: "Chooses a random entity for ya",
                                                  subcommands: [Number.self, Pick.self])
}

extension Random {
  struct Pick: ParsableCommand {
     static let configuration = CommandConfiguration(abstract: "Picks a random number from your input")

    @Option(default: 1, help: "The number of ements to choose")
    var count: Int
    
    @Argument()
    var elements: [String]
    
    func validate() throws {
      guard !elements.isEmpty else {
        throw ValidationError("Must provide atleast one element")
      }
    }
    
    func run() throws {
      let picks = elements.shuffled().prefix(count)
      print(picks.joined(separator: "\n"))
    }
  }
  
  
  struct Number: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Chooses a random number for ya")
    
    @Argument()
    var highValue: Int
    
    func validate() throws {
      guard highValue >= 1 else {
        throw ValidationError("Enter a number greater than 1")
      }
    }
    
    func run() throws {
      print(Int.random(in: 1...highValue))
    }
  }
}

Random.main()
