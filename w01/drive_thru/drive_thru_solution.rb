
Menu = {
  breakfast: ["pancake burger","waffle burger","toast burger"],
  lunch: ["pizza burger","hot dog burger","burger burger"],
  dinner: ["spaghetti burger","boom burger","dinner burger"]
}

class DriveThru
  def initialize(welcomeMessages,menu,attendentTalk)
    @welcomeMessage = welcomeMessages[rand(welcomeMessages.length)]
    @attendentTalk = attendentTalk
    @orderHistory = []
    @menuDisplay = ""
    @menu = []
    @attendentMood = ""
    @state = "ordering"
    @surupItems = ["pancake burger","waffle burger"]
    @butterItems = ["toast burger"]
    @barbaqueSauceItems = ["pizza burger"]
    @ketchupItems = ["hot dog burger","burger burger","boom burger","dinner burger"]
    @thatsItCount = 0
    @servingCustomer = true
    @atCounter = false
    @takeInute = true
    varBasedOnTime(menu)
  end

  def startService

    puts "\n#{@welcomeMessage}\n\n"
    puts @menuDisplay
    puts "\n"

    while @servingCustomer
      if(!@takeInput)
        @takeInput = true
        userInput = "_PLACEHOLDER_"
      else
        userInput = gets.chomp
      end
      if userInput == userInput.upcase
        userInput = userInput.downcase
        attendentReply(userInput)
      else
        puts "sorry Ma'am you'll have to speak alittle louder\n\n"
      end
    end
  end

  def attendentReply(userInput)
    case @state
    when "ordering"
      ordering(userInput)
    when "paying"
      paying(userInput)
    end
  end

  def ordering(orderedItem)
    if orderedItem == "thats it"
      @thatsItCount += 1
      if(@thatsItCount == 3)
        if(!@atCounter)
          puts "\npull over to the window"
        end
        @takeInput = false
        @state = "paying"
        @thatsItCount = 0
        @atCounter = true
      end
    elsif orderedItem == "_placeholder_"
      # pass
    else
      if !@menu.include?(orderedItem)
        if @orderHistory.include?(orderedItem)
          puts @attendentTalk[@attendentMood][:sameInvalidOrder]
        else
          puts @attendentTalk[@attendentMood][:invalidOrder]
        end
      else
        complimentaryItem(orderedItem)
      end

      @orderHistory.push(orderedItem)
    end
  end

  def complimentaryItem(orderedItem)
      compItem = ""
      if @surupItems.include?(orderedItem)
        compItem = "surup"
      elsif @butterItems.include?(orderedItem)
        compItem = "butter"
      elsif @barbaqueSauceItems.include?(orderedItem)
        compItem = "barbaque saurce"
      elsif @ketchupItems.include?(orderedItem)
        compItem = "ketchup"
      end
      if compItem.length > 0
        print "would you like #{compItem} with that? (Y)es (N)o: "
        gets.chomp
        puts "\n"
      end
  end

  def paying(userInput)
    puts "\nYour order is \n"
    if @orderHistory.empty?
      puts "Nothing"
    else
      @orderHistory.each {|item| puts item if @menu.include?(item)}
    end
    puts "[1] Remove Item"
    puts "[2] Add Item"
    print "[3] Leave\n"
    userInput = gets.chomp.to_i
    if userInput == 1
      puts "what item would you like to remove?"
      while true
        item = gets.chomp.downcase
        if item == "thats it"
          break;
        end
        if(@orderHistory.include?(item))
          @orderHistory.delete_at(@orderHistory.index(item))
        else
          puts "you didn't order that item\n\n"
        end
      end
    elsif userInput == 2
      puts "\nwhat would you like to add?"
      @state = "ordering"
    elsif  userInput == 3
      puts "have a nice day!"
      @servingCustomer = false
    else
      puts "invalid input"
    end
  end

  def varBasedOnTime(menu)
    case Time.new.hour
    when 0..10
      @menu = menu[:breakfast]
      @menuDisplay = " -- Breakfast Menu -- "
      @attendentMood = :crabby
    when 11..15
      @menu = menu[:lunch]
       @menuDisplay = " -- Lunch Menu -- "
       @attendentMood = :happy
    else
       @menuDisplay = " -- Dinner Menu -- "
      @menu = menu[:dinner]
      @attendentMood = :moderate
    end
    @menuDisplay += "\n"
    @menu.each {|item| @menuDisplay += "#{item}\n"}
  end
end



welcomeMessages = [
"Welcome to Ruby Burgers",
"Ruby Burgers what can I get you",
"Burgers from Rubyies what would you like",
"Rubyicous Burglars what can I get you"
]

Menu = {
  breakfast: ["pancake burger","waffle burger","toast burger"],
  lunch: ["pizza burger","hot dog burger","burger burger"],
  dinner: ["spaghetti burger","boom burger","dinner burger"]
}

attendentTalk = {
  crabby: {
    invalidOrder: "that is not a valid item idiot",
    sameInvalidOrder: "sheesh I already told you moron, we don't have that item"
  }, 
  happy: {
    invalidOrder: "I'm sorry Ma'am we currently do not have that item",
    sameInvalidOrder: "I'm very sorry, we still do not have that item"
  },
  moderate: {
    invalidOrder: "we don't have that",
    sameInvalidOrder: "like I said before, we don't have that"
  }
}




driveThru = DriveThru.new(welcomeMessages,Menu,attendentTalk)

driveThru.startService()



# 1. Welcome Message
#    Show menu 

# 2.    if not all caps => "I'm sorry you'll have to speak up Ma'am"
#    elsif item in menu => "would you like X with that?"
#                  else => "Thats is not on the menu"

# 3. if "THATS IT" 3 times => pull forward to the first window

# 4. if "drive away" => the attendent gets on your nerve and you decide to eat somewhere else 

# 5.
#   if 6:00 to 12:00 AM => Crabby && breakfast
#   if 12:00 to 6:00 PM => Happy && lunch
#   if 6:00 to 12:00 PM => Moderate && dinner 

# 6. 
#    Comfirm order display



