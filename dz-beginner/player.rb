class Player
  attr_accessor :health, :warrior

  def play_turn(warrior)
    before_turn(warrior)
    case target
    when "Empty"   then rest_or_walk
    when "Captive" then warrior.rescue!
    when "Enemy"   then warrior.attack!
    when "Archer"  then warrior.walk!
    end
    after_turn
  end

  private 

  def target
    return "Captive" if @warrior.feel.captive?
    return "Enemy"   unless @warrior.feel.empty?
    return "Archer"  if under_attack
    return "Empty"   if @warrior.feel.empty?
  end

  def rest_or_walk
    return @warrior.rest! unless @warrior.health == 20
    return @warrior.walk! if warrior.feel.empty?
  end

  def under_attack
    @warrior.health < @health
  end

  def before_turn(warrior)
    @warrior = warrior
    @health  = warrior.health unless @health
  end

  def after_turn
    @health = @warrior.health
  end
end
