class Adventure

  attr_reader :current_room, :inventory

  def initialize
    set_up_items
    set_inventory([])
    set_current_room('start')
  end

  def move(direction)
    pathway = Pathway.from_room_in_direction(current_room.key, direction)
    return false if pathway.nil?
    set_current_room(pathway.going_to)
  end

  def description
    current_room.description
  end

  def items_in(room)
    @items.select{|k,v| v == room}.keys
  end

  def items_in_current_room
    items_in(@current_room.key)
  end

  def take_item(item_name)
    return false unless item_in_current_room?(item_name)
    remove_item_from_room(item_name)
    @inventory << item_name
  end

  def drop_item(item_name)
    return false unless @inventory.include?(item_name)
    @inventory.delete(item_name)
    put_item_in_current_room(item_name)
  end

  private

  def set_current_room(key)
    room = Room.by_key(key)
    return false if room.nil?
    @current_room = room
  end

  def set_inventory(items)
    @inventory = items
  end

  def set_up_items
    @items = {
      'mirror' => 'deep river',
      'ladder' => 'old stone wall',
      'cake' => 'trees'
    }
  end

  def item_in_current_room?(item_name)
    items_in_current_room.include?(item_name)
  end

  def remove_item_from_room(item_name)
    @items.delete(item_name)
  end

  def put_item_in_current_room(item_name)
    @items[item_name] = current_room.key
  end

end
